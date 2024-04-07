local _timers = {}

local function setup_diagnostics(client, buffer)
  if require("vim.lsp.diagnostic")._enable then
    return
  end

  local diagnostic_handler = function()
    local params = vim.lsp.util.make_text_document_params(buffer)
    client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
      if err then
        local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
        vim.lsp.log.error(err_msg)
      end
      local diagnostic_items = {}
      if result then
        diagnostic_items = result.items
      end
      vim.lsp.diagnostic.on_publish_diagnostics(
        nil,
        vim.tbl_extend("keep", params, { diagnostics = diagnostic_items }),
        { client_id = client.id }
      )
    end)
  end

  diagnostic_handler() -- to request diagnostics on buffer when first attaching

  vim.api.nvim_buf_attach(buffer, false, {
    on_lines = function()
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
      _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
    end,
    on_detach = function()
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
    end,
  })
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }

    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      keymap.set('n', '<leader>k', vim.lsp.buf.hover, opts)
      keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
      keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
      keymap.set('n', '[d', vim.diagnostic.goto_next, opts)
      keymap.set('n', ']d', vim.diagnostic.goto_prev, opts)
      keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
      keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
      keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
      keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
      keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
      keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
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
    })

    local servers = {
      "eslint",
      "lua_ls",
      "clangd",
      "bashls",
      "pyright",
      "jsonls",
      "html",
      "tsserver",
      "cssls",
      "vimls",
      "terraformls",
      "tflint",
    }

    for _, server in pairs(servers) do
      if server == 'lua_ls' then
        lspconfig[server].setup({
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
              },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
              },
              telemetry = {
                enable = false,
              },
            },
          },
        })
      else
        lspconfig[server].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end
    end
  end,
}
