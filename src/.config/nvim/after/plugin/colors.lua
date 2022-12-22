-- `:%s/onedark/purify/g` in case you want purify as your default colorscheme.

function SetColorscheme(color)
	color = color or "onedark"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

SetColorscheme()
