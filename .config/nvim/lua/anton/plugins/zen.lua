return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  opts = {
    plugins = {
      gitsigns = true,
      tmux = true,
    },
    window = {
      width = 110,
      options = {
        number = true,
        relativenumber = true,
      },
    },
  },
}
