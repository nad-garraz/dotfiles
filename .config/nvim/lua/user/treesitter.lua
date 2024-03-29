-- local status_ok, treesitter = pcall(require, "nvim-treesitter")
-- if not status_ok then
-- 	return
-- end

local status_ok2, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok2 then
	return
end

configs.setup({
	ensure_installed = {
		"c",
		"lua",
		"markdown",
		"markdown_inline",
		-- "bash",
		"python",
		"html",
		"css",
		"javascript",
	}, -- put the language you want in this array
	-- ensure_installed = "all",
  -- one of "all" or a list of languages	
  ignore_install = { }, -- List of parsers to ignore installing
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)

	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css", "html" } },

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
