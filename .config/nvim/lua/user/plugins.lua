local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window with rounded borders...
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
	git = {
		clone_timeout = 300, -- Timeout, in seconds, for git clones
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({ "wbthomason/packer.nvim"}) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs"}) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", commit = "0236521ea582747b58869cb72f70ccfa967d2e89" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "nvim-tree/nvim-web-devicons" })
	use({ "nvim-tree/nvim-tree.lua"})

	-- })
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/toggleterm.nvim", commit = "12cba0a1967b4f3f31903484dec72a6100dcf515" })
	use({ "norcalli/nvim-colorizer.lua", commit = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" })
	use({ "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" })
	use({ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" })
	use({ "lukas-reineke/indent-blankline.nvim", commit = "9637670896b68805430e2f72cf5d16be5b97a22a" })
	use({ "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" })

	-- Colorschemes
	use({ "folke/tokyonight.nvim", commit = "9a01eada39558dc3243278e6805d90e8dff45dc0" })
	use({ "lunarvim/darkplus.nvim", commit = "13ef9daad28d3cf6c5e793acfc16ddbf456e1c83" })
	use({ "Mofiqul/dracula.nvim", commit = "948d237241b91389c8c2f109885b91cd2574b8bb" })

	-- Cmp
	use({ "hrsh7th/nvim-cmp"}) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }) -- path completions
	use({ "hrsh7th/cmp-nvim-lua", commit = "f12408bdb54c39c23e67cab726264c10db33ada" })
	use({ "hrsh7th/cmp-nvim-lsp", commit = "44b16d11215dce86f253ce0c30949813c0a90765" })
  
	use({ "saadparwaiz1/cmp_luasnip"})
	use({ "L3MON4D3/LuaSnip", tag = "v2.*", run = "make install_jsregexp"}) --snippet engine
	use({ "mlaursen/vim-react-snippets", commit = "dbf0c856a8e8889412144d8fdd49837384818c5f" }) -- snippet completions


	use({ "rafamadriz/friendly-snippets", commit = "43727c2ff84240e55d4069ec3e6158d74cb534b6" }) -- a bunch of snippets to use
	use({ "honza/vim-snippets", commit = "ccc2fa1529d372f7ac16d5eb07a385a72b50e05d" }) -- snippet completions

	-- registers
	use({ "tversteeg/registers.nvim", commit = "f7f7b8a55de10293e2af6002d4da98cbeffc6333" }) -- snippet completions

	-- LSP
	use({ "williamboman/mason.nvim"})
	use({ "williamboman/mason-lspconfig.nvim", commit = "796008869e67ef27a5aa5ac44c08ce2a60b89f55" })
	use({ "neovim/nvim-lspconfig", commit = "a27356f1ef9c11e1f459cc96a3fcac5c265e72d6" }) -- enable LSP

	use({ "mhartington/formatter.nvim", commit = "44c89f09dcc220dc2a9b056e93c3a87c86e79804" }) -- for formatters and linters
	use({ "mfussenegger/nvim-lint", commit = "9b6cb72660114e5f188907be0d866a8ca2b0ef23" }) -- for formatters and linters
	use({ "RRethy/vim-illuminate", commit = "6acf7d4a18255a3ddc43770866c8e148fe85af7b" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim" })

	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter"})

	-- Git
	use({ "lewis6991/gitsigns.nvim"})

	-- DAP
	use({ "mfussenegger/nvim-dap"})
  use({"leoluz/nvim-dap-go"})
	use({ "rcarriga/nvim-dap-ui" })
	use({ "nvim-telescope/telescope-dap.nvim" })
	use({ "theHamsta/nvim-dap-virtual-text" })

	-- rainbow-delimiters
	use({ "HiPhish/rainbow-delimiters.nvim" })

	-- HOP
	use({ "smoka7/hop.nvim", commit = "f2508f415b9fe34082696009574ca26f57a66531" })

	-- Harpoon
	use({ "ThePrimeagen/harpoon", commit = "c1aebbad9e3d13f20bedb8f2ce8b3a94e39e424a" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
