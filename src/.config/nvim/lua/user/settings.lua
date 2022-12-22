-- Smart dd

local function delete_special()
	local line_data = vim.api.nvim_win_get_cursor(0) -- returns {row, col}
	local current_line = vim.api.nvim_buf_get_lines(0, line_data[1]-1, line_data[1], false)
	if current_line[1] == "%s*" then
		return '"_dd'
	else
		return 'dd'
	end
end

vim.keymap.set( "n", "dd", delete_special, { noremap = true, expr = true } )

-- Smart d

local function smart_d()
	local l, c = unpack(vim.api.nvim_win_get_cursor(0))
	for _, line in ipairs(vim.api.nvim_buf_get_lines(0, l - 1, l, true)) do
		if line:match("^%s*$") then
			return "\"_d"
		end
	end
	return "d"
end

vim.keymap.set("v", "d", smart_d, { noremap = true, expr = true } )

vim.cmd('source /home/anton/.config/nvim/vim/user/settings.vim')
