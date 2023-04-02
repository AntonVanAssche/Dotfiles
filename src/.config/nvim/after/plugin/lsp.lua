local lspkind_status_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_status_ok then
  return
end

lspkind.init()

local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
  return
end

local cmp_mappings = {
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-e>'] = cmp.mapping(function(fallback)
        cmp.mapping.abort()
        local copilot_keys = vim.fn['copilot#Accept']()
        if copilot_keys ~= '' then
            vim.api.nvim_feedkeys(copilot_keys, 'i', true)
        else
            fallback()
        end
    end),
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
}

local cmp_sources = {
    { name = "buffer", keyword_length = 4 },
    { name = 'nvim_lsp' },
    { name = 'cmp_tabnine' },
    { name = 'luasnip' },
    { name = 'treesitter' },
    { name = 'path' },
}

local cmp_format = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
        local kind = lspkind.cmp_format({ mode = 'symbol_text', maxwidth = 50 })(entry, vim_item)
        local strings = vim.split(kind.kind, '%s')
        kind.kind = ' ' .. strings[1] .. ' '
        kind.menu = "    (" .. string.lower(strings[2]) .. ")"

        return kind
    end
}

cmp.setup {
    mapping = cmp_mappings,
    sources = cmp_sources,
    formatting = cmp_format,
    window = {
        documentation = {
            border = 'rounded',
        },
        completion = {
            border = 'rounded',

            winhighlight = 'NormalFloat:CmpWindow,FloatBorder:CmpWindowBorder',
            side_padding = 0,

            -- Because of the border, move the completion window 3 columns to the left
            -- so that text in the editor and on completion item can be aligned properly.
            col_offset = -3,
        },
    },
    experimental = {
        ghost_text = false,
        native_menu = false,
    },
}

-- Enable command-line completion.
-- Not sure if I kept it enabled.
-- I like it, but sometimes a bit annoying.
cmp.setup.cmdline(':', {
    sources = {
        { name = 'cmdline' },
    },
    formatting = {
        fields = { 'abbr' },
    }
})

local function lsp_keymaps(client, bufnr)
    local opts = {
        buffer = bufnr,
        noremap = true,
        silent = true,
    }

    local keymap = vim.keymap.set

    if client.name == 'eslint' then
        vim.cmd.LspStop('eslint')
        return
    end

    -- Mappings.
    keymap('n', 'gd', vim.lsp.buf.definition, opts)
    keymap('n', 'gi', vim.lsp.buf.implementation, opts)
    keymap('n', '<leader>k', vim.lsp.buf.hover, opts)
    keymap('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
    keymap('n', '<leader>vd', vim.diagnostic.open_float, opts)
    keymap('n', '[d', vim.diagnostic.goto_next, opts)
    keymap('n', ']d', vim.diagnostic.goto_prev, opts)
    keymap('n', '<leader>vca', vim.lsp.buf.code_action, opts)
    keymap('n', '<leader>vrr', vim.lsp.buf.references, opts)
    keymap('n', '<leader>vrn', vim.lsp.buf.rename, opts)
    keymap('i', '<C-h>', vim.lsp.buf.signature_help, opts)
    keymap('n', '<F2>', vim.lsp.buf.rename, opts)
    keymap('n', '<F4>', vim.lsp.buf.code_action, opts)
    keymap('x', '<F4>', vim.lsp.buf.range_code_action, opts)
end

local M = {}

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_nvim_lsp_status_ok then
  return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
    local signs = {
        { name = 'DiagnosticSignError', text = '' },
        { name = 'DiagnosticSignWarn', text = '' },
        { name = 'DiagnosticSignInfo', text = '' },
        { name = 'DiagnosticSignHint', text = '' },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.name, numhl = '' })
    end

    local config = {
        virtual_text = false,
        signs = { active = signs },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = 'minimal',
            border = 'rounded',
            source = 'always',
            header = '',
            prefix = '',
        }
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = 'rounded',
    })

    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = 'rounded',
    })
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(client, bufnr)
end

local servers = {
    'eslint',
    'lua_ls',
    'clangd',
    'bashls',
    'pyright',
    'jsonls',
    'html',
    'tsserver',
    'cssls',
    'vimls',
}

local settings = {
    ui = {
        border = 'rounded',
        icons = {
            package_installed = '',
            package_pending = '➜',
            package_uninstalled = '',
        }
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4
}

local mason_status_ok, mason = pcall(require, 'mason')
if mason_status_ok then
    mason.setup(settings)
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, 'mason.lspconfig')
if mason_lspconfig_status_ok then
    mason_lspconfig.setup(settings)
end

local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    return
end

for _, server in pairs(servers) do

    if server == 'lua_ls' then
        lspconfig[server].setup({
            on_attach = M.on_attach,
            capabilities = M.capabilities,
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })
    else
        lspconfig[server].setup({
            on_attach = M.on_attach,
            capabilities = M.capabilities,
        })
    end
end

-- Configure Pmenu highlights for cmp completion menu.
-- I know it's not the best way to do it! ;)
-- For some reason I can't get it to work when customizing it by configuring floating windows.
do
    vim.cmd [[
        " Dark background, and white-ish foreground
        highlight! Pmenu         guibg=#202020
        highlight! PmenuBorder   guibg=#FAFAFA
        highlight! ItemAbbr      guifg=#FAFAFA
        highlight! CmpItemAbbrDeprecated    guibg=NONE gui=strikethrough guifg=#ABB2BF
        highlight! CmpItemAbbrMatch         guibg=NONE guifg=#E06C75 gui=bold
        highlight! CmpItemAbbrMatchFuzzy    guibg=NONE guifg=#61AFEF gui=bold
        highlight!      CmpItemKindModule        guibg=NONE guifg=#61AFEF
        highlight!      CmpItemKindClass         guibg=NONE guifg=#E5C07B
        highlight! link CmpItemKindStruct        CmpItemKindClass
        highlight!      CmpItemKindVariable      guibg=NONE guifg=#56B6C2
        highlight!      CmpItemKindProperty      guibg=NONE guifg=#56B6C2
        highlight!      CmpItemKindFunction      guibg=NONE guifg=#C586C0
        highlight! link CmpItemKindConstructor   CmpItemKindFunction
        highlight! link CmpItemKindMethod        CmpItemKindFunction
        highlight!      CmpItemKindKeyword       guibg=NONE guifg=#C586C0
        highlight!      CmpItemKindText          guibg=NONE guifg=#FAFAFA
        highlight!      CmpItemKindUnit          guibg=NONE guifg=#D4D4D4
        highlight!      CmpItemKindConstant      guibg=NONE guifg=#98C379
        highlight!      CmpItemKindSnippet       guibg=NONE guifg=#E5C07B
    ]]
end

M.setup()
