-- `:%s/onedark/purify/g` in case you want purify as your default colorscheme.

function SetColorscheme(color)
	color = color or "onedark"
	vim.cmd.colorscheme(color)

    -- Set the background to none so that the background color is transparent
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    -- Set the comments to 'bold', 'italic' and 'grey'.
    vim.api.nvim_set_hl(0, "Comment", { fg = '#545A65', bold = true, italic = true })
end

SetColorscheme()
