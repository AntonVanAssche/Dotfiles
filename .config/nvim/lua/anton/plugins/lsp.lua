return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
    "dense-analysis/ale",
    "onsails/lspkind.nvim",
    "zbirenbaum/copilot.lua",
    "zbirenbaum/copilot-cmp",
  },

  config = function()
    local cmp = require("cmp")
    local cmp_lsp = require("cmp_nvim_lsp")
    local copilot_cmp = require("copilot_cmp")
    local capabilities =
      vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

    require("fidget").setup({})
    require("mason").setup()

    local g = vim.g

    g.ale_linters = {
      markdown = { "markdownlint" },
    }

    g.ale_linters_explicit = 1

    g.ale_markdown_markdownlint_executable = "markdownlint-cli2"

    g.ale_lint_on_insert_leave = 1

    local servers = {
      "ansiblels",
      "bashls",
      "dockerls",
      "lua_ls",
      "puppet",
      "rubocop",
      "terraformls",
      "tflint",
    }

    vim.api.nvim_create_user_command("MasonInstallAll", function()
      if servers and #servers > 0 then
        vim.cmd("MasonInstall " .. table.concat(servers, " "))
      end
    end, {})

    require("mason-lspconfig").setup({
      ensure_installed = servers,
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,

        ["puppet"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.puppet.setup({
            capabilities = capabilities,
            cmd = { os.getenv("HOME") .. "/bin/puppet-languageserver", "--stdio" },
          })
        end,

        ["rubocop"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.rubocop.setup({
            capabilities = capabilities,
            cmd = { os.getenv("HOME") .. "/bin/rubocop", "--start-server", "--no-detach" },
          })
        end,

        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim", "it", "describe", "before_each", "after_each" },
                },
              },
            },
          })
        end,

        ["bashls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.bashls.setup({
            capabilities = capabilities,
            cmd = { "bash-language-server", "start" },
          })
        end,

        ["ansiblels"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.ansiblels.setup({
            capabilities = capabilities,
            settings = {
              ansible = {
                ansible = {
                  path = "ansible",
                },
                executionEnvironment = {
                  enabled = false,
                },
                python = {
                  interpreterPath = "python",
                  validation = {},
                  enabled = true,
                  lint = {
                    enabled = true,
                    path = "ansible-lint",
                  },
                },
              },
            },
            cmd = { "ansible-language-server", "--stdio" },
            filetypes = { "yaml", "ansible" },
          })
        end,

        ["dockerls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.dockerls.setup({
            capabilities = capabilities,
            settings = {
              docker = {
                languageserver = {
                  formatter = {
                    ignoreMultilineInstructions = true,
                  },
                },
              },
            },
            cmd = { "docker-langserver", "--stdio" },
            filetypes = { "Dockerfile", "dockerfile" },
            root_dir = lspconfig.util.root_pattern("Dockerfile", "Containerfile"),
          })
        end,
      },
    })

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }
    keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
    keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
    keymap.set("n", "gI", require("telescope.builtin").lsp_implementations, opts)
    keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)
    keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
    keymap.set("n", "<F4>", vim.lsp.buf.code_action, opts)

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    copilot_cmp.setup()
    require("lspkind").init({
      symbol_map = {
        Copilot = "",
      },
    })

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
        { name = "copilot" },
      }, {
        { name = "buffer" },
      }),
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = require("lspkind").cmp_format({
          mode = "symbol",
          maxwidth = 50,
          ellipsis_char = "...",
          show_labelDetails = true,
        }),
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
    })

    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    vim.diagnostic.config({
      virtual_text = false,
      signs = { active = signs },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#202020", fg = "NONE" })
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "#202020" })
    vim.api.nvim_set_hl(0, "PmenuBorder", { bg = "#202020" })
    vim.api.nvim_set_hl(0, "ItemAbbr", { bg = "NONE", fg = "#FAFAFA" })
    vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", fg = "#ABB2BF", strikethrough = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#E06C75", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { bg = "NONE", fg = "#61AFEF", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemKindModule", { bg = "NONE", fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "CmpItemKindClass", { bg = "NONE", fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#56B6C2" })
    vim.api.nvim_set_hl(0, "CmpItemKindProperty", { bg = "NONE", fg = "#56B6C2" })
    vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
    vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { bg = "NONE", fg = "#C586C0" })
    vim.api.nvim_set_hl(0, "CmpItemKindMethod", { bg = "NONE", fg = "#C586C0" })
    vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#C586C0" })
    vim.api.nvim_set_hl(0, "CmpItemKindText", { bg = "NONE", fg = "#FAFAFA" })
    vim.api.nvim_set_hl(0, "CmpItemKindUnit", { bg = "NONE", fg = "#D4D4D4" })
    vim.api.nvim_set_hl(0, "CmpItemKindConstant", { bg = "NONE", fg = "#98C379" })
    vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { bg = "NONE", fg = "#E5C07B" })
  end,
}
