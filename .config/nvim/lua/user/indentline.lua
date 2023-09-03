local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end


-- Color de la linea que marca el primer intent del contexto
vim.cmd([[highlight IndentBlanklineContextChar guifg=#00dddd gui=nocombine]])
-- Color del resto de los espacios del indent que no están
-- incluídos en lo de arriba.
vim.cmd([[highlight IndentBlanklineChar guifg=#035147 gui=nocombine]])
-- subrayado
vim.cmd([[highlight IndentBlanklineContextStart guisp=#00dddd gui=underline]])

indent_blankline.setup({
	show_current_context = true,
	show_current_context_start = true,
	char = "󰯉",
	context_char = "󰯉",-- "▏", --'█'
	show_trailing_blankline_indent = false,
	show_first_indent_level = true,
	use_treesitter = true,
	buftype_exclude = { "terminal", "nofile" },
	filetype_exclude = {
		"help",
		"packer",
		"NvimTree",
	},
})
