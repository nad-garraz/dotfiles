local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local filetype = {
	"filetype",
	icons_enabled = true,
}

local location = {
	"location",
	padding = 0,
}

local buffers = {
	"buffers",
	show_filename_only = true,
	max_length = vim.o.columns * 3 / 5,
	mode = 2,
	use_mode_colors = false,
	buffers_color = {
	-- 	-- Same values as the general color option can be used here.
		active = {bg = '#70a3ff', fg = '#000000'}, -- Color for active buffer.
		inactive = {fg = '#747454'}, -- Color for active buffer.
	-- 	inactive = "lualine_{section}_inactive", -- Color for inactive buffer.
	},
	symbols = {
		modified = " ●", -- Text to show when the buffer is modified
		alternate_file = "#", -- Text to show to identify the alternate file
		directory = "", -- Text to show when the buffer is a directory
	},
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "harpoon", "toggleterm" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { diagnostics, buffers },
		lualine_x = { diff, spaces, "encoding", filetype },
		lualine_y = { location },
		lualine_z = { "progress" },
	},
})
