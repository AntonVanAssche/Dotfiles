return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim",
    "zbirenbaum/copilot.lua",
    "zbirenbaum/copilot-cmp",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")
    local copilot_cmp = require("copilot_cmp")

    copilot_cmp.setup()
    lspkind.init({
      symbol_map = {
        Copilot = "",
      },
    })
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping.confirm({ select = false }),
      }),
      sources = cmp.config.sources({
        { name = 'copilot', group_index = 1, priority = 100 },
        { name = 'nvim_lsp', group_index = 1 },
        { name = "buffer", keyword_length = 4 },
        { name = 'luasnip' },
        { name = 'treesitter' },
        { name = 'path' },
      }),
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
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

    vim.api.nvim_set_hl(0, "PmenuSel",               { bg = "#202020", fg = "NONE" })
    vim.api.nvim_set_hl(0, "Pmenu",                  { bg = "#202020" })
    vim.api.nvim_set_hl(0, "PmenuBorder",            { bg = "#202020" })
    vim.api.nvim_set_hl(0, "ItemAbbr",               { bg = "NONE",    fg = "#FAFAFA" })
    vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated",  { bg = "NONE",    fg = "#ABB2BF", strikethrough = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatch",       { bg = "NONE",    fg = "#E06C75", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy",  { bg = "NONE",    fg = "#61AFEF", bold = true })
    vim.api.nvim_set_hl(0, "CmpItemKindModule",      { bg = "NONE",    fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "CmpItemKindClass",       { bg = "NONE",    fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "CmpItemKindVariable",    { bg = "NONE",    fg = "#56B6C2" })
    vim.api.nvim_set_hl(0, "CmpItemKindProperty",    { bg = "NONE",    fg = "#56B6C2" })
    vim.api.nvim_set_hl(0, "CmpItemKindFunction",    { bg = "NONE",    fg = "#C586C0" })
    vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { bg = "NONE",    fg = "#C586C0" })
    vim.api.nvim_set_hl(0, "CmpItemKindMethod",      { bg = "NONE",    fg = "#C586C0" })
    vim.api.nvim_set_hl(0, "CmpItemKindKeyword",     { bg = "NONE",    fg = "#C586C0" })
    vim.api.nvim_set_hl(0, "CmpItemKindText",        { bg = "NONE",    fg = "#FAFAFA" })
    vim.api.nvim_set_hl(0, "CmpItemKindUnit",        { bg = "NONE",    fg = "#D4D4D4" })
    vim.api.nvim_set_hl(0, "CmpItemKindConstant",    { bg = "NONE",    fg = "#98C379" })
    vim.api.nvim_set_hl(0, "CmpItemKindSnippet",     { bg = "NONE",    fg = "#E5C07B" })


  end,
}
