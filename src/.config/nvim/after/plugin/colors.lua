local onedark_status_ok, onedark = pcall(require, 'onedark')
if not onedark_status_ok then
    return
end

onedark.setup {
    style = "dark",
    transparent = true,
    term_colors = true,

    lualine = {
        transparent = true,
    },
}

local color = color or "onedark"
vim.cmd.colorscheme(color)

local colorizer_status_ok, colorizer = pcall(require, 'colorizer')
if not colorizer_status_ok then
    return
end

colorizer.setup()
