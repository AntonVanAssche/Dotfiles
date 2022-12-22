local lsp_status_ok, lsp = pcall(require, 'lsp-zero')
if not lsp_status_ok then
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

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then
    return
end

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

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

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
    local opts = {buffer = bufnr, noremap = true, silent = true}

    if client.name == 'eslint' then
        vim.cmd.LspStop('eslint')
        return
    end

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
    vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
end)

vim.diagnostic.config({
    virtual_text = true,
})

lsp.setup()
