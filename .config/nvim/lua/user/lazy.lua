local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system {
	  'git',
	  'clone',
	  '--filter=blob:none',
	  '--branch=stable',
	  lazyrepo,
	  lazypath }
end ---@diagnostic disable-next-line: undefined-field

vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup {
	spec = LAZY_PLUGIN_SPEC, -- Global donde meto todos los specs
	install = {
		colorscheme = { "darkplus", "default" },
	},
	ui = {
		border = "rounded",
	},
	change_detection = {
		enable = true,
		notify = false,
	},
}
