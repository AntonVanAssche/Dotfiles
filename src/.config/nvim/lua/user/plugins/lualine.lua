local colors = {
	blue   = '#61AFEF',
	cyan   = '#56B6C2',
	black  = '#282C34',
	white  = '#FAFAFA',
	red    = '#E06C75',
	violet = '#98C379',
	grey   = '#202020',
	transparent = '#FFF',
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.violet },
    		b = { fg = colors.white, bg = colors.grey },
    		c = { fg = colors.white, bg = colors.transparent},
  	},

  	insert = {
		a = {fg = colors.black, bg = colors.blue} 
	},
  	visual = {
		a = {fg = colors.black, bg = colors.cyan} 
	},
  	replace = { 
		a = {fg = colors.black, bg = colors.red} 
	},

  	inactive = {
    		a = {fg = colors.white, bg = colors.black},
    		b = {fg = colors.white, bg = colors.black},
    		c = {fg = colors.black, bg = colors.black},
  },
}


require('lualine').setup {
	options = {
    		theme = bubbles_theme,
    		component_separators = '|',
    		section_separators = { left = '', right = '' },
  	},
  	sections = {
    		lualine_a = {
      			{ 'mode', separator = { left = '' }, right_padding = 2 },
    		},
    		lualine_b = { 'filename', 'branch' },
    		lualine_c = { 'fileformat' },
    		lualine_x = {},
    		lualine_y = { 'filetype', 'progress' },
    		lualine_z = {
      			{ 'location', separator = { right = '' }, left_padding = 2 },
    		},
  	},
  	inactive_sections = {
    		lualine_a = { { 'filename', separator = { left = '' }, right_padding = 2 } },
    		lualine_b = {},
    		lualine_c = {},
    		lualine_x = {},
    		lualine_y = {},
    		lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 } },
  	},
  	tabline = {},
  	extensions = {},
}	

