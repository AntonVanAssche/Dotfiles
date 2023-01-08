-- Skeleton files.
local skelGrp = vim.api.nvim_create_augroup('SkeletonWrites', { clear = true })
vim.api.nvim_create_autocmd('BufNewFile', {
	command = '0r ~/.config/nvim/skeletons/skel.sh',
	pattern = { '*.sh' },
	group = skelGrp,
})

vim.api.nvim_create_autocmd('BufNewFile', {
	command = '0r ~/.config/nvim/skeletons/skel.py',
	pattern = { '*.py' },
	group = skelGrp,
})
