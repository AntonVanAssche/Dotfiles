local lsp_status_ok, lsp = pcall(require, 'lsp-zero')
if not lsp_status_ok then
    return
end

local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
    return
end

local lspkind_status_ok, lspkind = pcall(require, 'lspkind')
if not lspkind_status_ok then
    return
end

lsp.preset('recommended')

lsp.ensure_installed({
    'eslint',
    'sumneko_lua',
    'clangd',
    'bashls',
    'pyright',
    'jsonls',
    'html',
    'tsserver',
    'cssls',
    'vimls',
})

-- Fix Undefined global 'vim'.
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp_mappings = lsp.defaults.cmp_mappings({
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
})

-- Disable completion with tab
-- this helps with copilot setup.
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

-- Disable completion with enter.
cmp_mappings['<CR>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    window = {
        documentation = {
            border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
        },
        completion = {
            -- Use border for the completion window.
            -- Doesn't seems to work.
            -- Don't really know why.
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },

            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            side_padding = 0,

            -- Because of the border, move the completion window 3 columns to the left
            -- so that text in the editor and on completion item can be aligned properly.
            col_offset = -3,
        },
    },
    formatting = {
		fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. strings[1] .. " "
            kind.menu = "    (" .. string.lower(strings[2]) .. ")"

            return kind
        end,
    },
})

-- Enable command-line completion.
-- Not sure if I kept it enabled.
-- I like it, but sometimes a bit annoying.
cmp.setup.cmdline(':', {
    sources = {
        { name = 'cmdline' },
    },
    formatting = {
        fields = { "abbr" },
    }
})

-- Set linting icons.
lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '',
        warn = '',
        hint = '',
        info = '',
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = {
        buffer = bufnr,
        noremap = true,
        silent = true
    }

    if client.name == 'eslint' then
        vim.cmd.LspStop('eslint')
        return
    end

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>K', vim.lsp.buf.hover, opts) -- Update (comment out): ~/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim/lua/lsp-zero/server.lua:150
    vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
    vim.keymap.set('x', '<F4>', vim.lsp.buf.range_code_action, opts)
end)

vim.diagnostic.config({
    virtual_text = true,
})

-- Configure Pmenu highlights for cmp completion menu.
-- I know it's not the best way to do it! ;)
-- For some reason I can't get it to work when customizing it by configuring floating windows.
do
    vim.cmd [[
        " Dark background, and white-ish foreground
        highlight! Pmenu         guibg=#202020
        highlight! PmenuBorder   guibg=#abb2bf
        highlight! ItemAbbr      guifg=#FAFAFA
        highlight! CmpItemAbbrDeprecated    guibg=NONE gui=strikethrough guifg=#abb2bf
        highlight! CmpItemAbbrMatch         guibg=NONE guifg=#e06c75 gui=bold
        highlight! CmpItemAbbrMatchFuzzy    guibg=NONE guifg=#61afef gui=bold
        highlight!      CmpItemKindModule        guibg=NONE guifg=#61afef
        highlight!      CmpItemKindClass         guibg=NONE guifg=#e5c07b
        highlight! link CmpItemKindStruct        CmpItemKindClass
        highlight!      CmpItemKindVariable      guibg=NONE guifg=#56b6c2
        highlight!      CmpItemKindProperty      guibg=NONE guifg=#56b6c2
        highlight!      CmpItemKindFunction      guibg=NONE guifg=#C586C0
        highlight! link CmpItemKindConstructor   CmpItemKindFunction
        highlight! link CmpItemKindMethod        CmpItemKindFunction
        highlight!      CmpItemKindKeyword       guibg=NONE guifg=#C586C0
        highlight!      CmpItemKindText          guibg=NONE guifg=#FAFAFA
        highlight!      CmpItemKindUnit          guibg=NONE guifg=#D4D4D4
        highlight!      CmpItemKindConstant      guibg=NONE guifg=#98c379
        highlight!      CmpItemKindSnippet       guibg=NONE guifg=#e5c07b
    ]]
end

lsp.setup()
