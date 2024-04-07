return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      PATH = "prepend",
      ui = {
        border = 'rounded',
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
      log_level = vim.log.levels.INFO,
      max_concurrent_installers = 4,
      automatic_installation = true,
    })

    local settings = {
      ensure_installed = {
        "ansible-lint",
        "bash-language-server",
        "clangd",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "hclfmt",
        "jq",
        "markdownlint",
        "marksman",
        "pylint",
        "shellcheck",
        "stylua",
        "lua-language-server",
        "terraform-ls",
        "tflint",
        "vim-language-server",
        "yamllint",
        "ruby-lsp",
        "rubyfmt",
      },
    }

    vim.api.nvim_create_user_command("MasonInstallAll", function()
      if settings.ensure_installed and #settings.ensure_installed > 0 then
        vim.cmd("MasonInstall " .. table.concat(settings.ensure_installed, " "))
      end
    end, {})
  end,
}
