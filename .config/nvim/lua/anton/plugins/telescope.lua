return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "debugloop/telescope-undo.nvim",
    "nvim-lua/plenary.nvim",
    "xiyaowong/telescope-emoji.nvim",
    "dhruvasagar/vim-prosession",
  },
  config = function()
    local open_with_trouble = require("trouble.sources.telescope").open
    local builtin = require("telescope.builtin")
    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
        layout_strategy = "vertical",
        layout_config = { width = 0.8 },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<c-t>"] = open_with_trouble,
          },
          n = { ["<c-t>"] = open_with_trouble },
        },
      },
    })

    require("telescope").load_extension("fzf")
    require("telescope").load_extension("undo")
    require("telescope").load_extension("prosession")

    vim.keymap.set(
      "n",
      "<leader>fa",
      "<cmd>Telescope find_files hidden=true<cr>",
      { desc = "Find files including hidden files" }
    )
    vim.keymap.set("n", "<leader>ff", builtin.git_files, {})
    vim.keymap.set("n", "<leader>fp", "<cmd>Telescope prosession<CR>", { desc = "Load session" })
    vim.keymap.set("n", "<leader>fe", "<cmd>Telescope emoji<CR>", { desc = "Insert Emoji" })
    vim.keymap.set("n", "<leader>fw", function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set("n", "<leader>fW", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set("n", "<leader>fP", function()
      local word = vim.fn.getreg("''")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set("n", "<leader>fg", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    vim.keymap.set("n", "<leader>fs", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fc", builtin.command_history, {})
    vim.keymap.set("n", "<leader>fC", builtin.commands, {})
    vim.keymap.set("n", "<leader>fS", builtin.search_history, {})
    vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, {})
    vim.keymap.set("n", "<leader>fA", builtin.builtin, {})
    vim.keymap.set("n", "<leader>fl", builtin.current_buffer_fuzzy_find, {})
    vim.keymap.set("n", "<leader>fr", builtin.registers, {})
    vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Find TODOs" })
  end,
}
