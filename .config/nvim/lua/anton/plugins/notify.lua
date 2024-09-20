return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		notify.setup({
			stages = "fade_in_slide_out",
			on_open = nil,
			on_close = nil,
			render = "default",
			timeout = 175,
			background_colour = "#202020",
			minimum_width = 10,
			icons = {
				ERROR = "",
				WARN = "",
				INFO = "",
				DEBUG = "",
				TRACE = "",
			},
		})

		vim.api.nvim_set_hl(0, "NotifyERRORBorder", { fg = "#E06C75" })
		vim.api.nvim_set_hl(0, "NotifyWARNBorder", { fg = "#E5C07B" })
		vim.api.nvim_set_hl(0, "NotifyINFOBorder", { fg = "#61AFEF" })
		vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", { fg = "#ABB2BF" })
		vim.api.nvim_set_hl(0, "NotifyTRACEBorder", { fg = "#C678DD" })
		vim.api.nvim_set_hl(0, "NotifyERRORIcon", { fg = "#E06C75" })
		vim.api.nvim_set_hl(0, "NotifyWARNIcon", { fg = "#E5C07B" })
		vim.api.nvim_set_hl(0, "NotifyINFOIcon", { fg = "#61AFEF" })
		vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", { fg = "#ABB2BF" })
		vim.api.nvim_set_hl(0, "NotifyTRACEIcon", { fg = "#C678DD" })
		vim.api.nvim_set_hl(0, "NotifyERRORTitle", { fg = "#E06C75" })
		vim.api.nvim_set_hl(0, "NotifyWARNTitle", { fg = "#E5C07B" })
		vim.api.nvim_set_hl(0, "NotifyINFOTitle", { fg = "#61AFEF" })
		vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", { fg = "#ABB2BF" })
		vim.api.nvim_set_hl(0, "NotifyTRACETitle", { fg = "#C678DD" })
	end,
}
