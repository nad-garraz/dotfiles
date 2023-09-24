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
	use({ "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs", commit = "ae5b41ce880a6d850055e262d6dfebd362bb276e" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", commit = "0236521ea582747b58869cb72f70ccfa967d2e89" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "32d9627123321db65a4f158b72b757bcaef1a3f4" })
	use({ "kyazdani42/nvim-web-devicons", commit = "9ab9b0b894b2388a9dbcdee5f00ce72e25d85bf9" })
	use({ "kyazdani42/nvim-tree.lua", commit = "a708bd2413d467929b5019ec1bce7b1f428438bc" })

	-- use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons", commit = "9961d87bb3ec008213c46ba14b3f384a5f520eb",
	-- })
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({ "nvim-lualine/lualine.nvim", commit = "05d78e9fd0cdfb4545974a5aa14b1be95a86e9c9" })
	use({ "akinsho/toggleterm.nvim", commit = "12cba0a1967b4f3f31903484dec72a6100dcf515" })
	use({ "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" })
	use({ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" })
	use({ "lukas-reineke/indent-blankline.nvim", commit = "9637670896b68805430e2f72cf5d16be5b97a22a" })
	use({ "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" })

	-- Colorschemes
	use({ "folke/tokyonight.nvim", commit = "9a01eada39558dc3243278e6805d90e8dff45dc0" })
	use({ "lunarvim/darkplus.nvim", commit = "13ef9daad28d3cf6c5e793acfc16ddbf456e1c83" })
	use({ "Mofiqul/dracula.nvim", commit = "948d237241b91389c8c2f109885b91cd2574b8bb" })

	-- Cmp
	use({ "hrsh7th/nvim-cmp", commit = "c4e491a87eeacf0408902c32f031d802c7eafce8" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }) -- path completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "44b16d11215dce86f253ce0c30949813c0a90765" })
	use({ "SirVer/ultisnips", commit = "24a3ebb36687b6d59a19d63173713575b486d739" })

	-- SOURCES
	use({ "rafamadriz/friendly-snippets", commit = "6e0afe3be0ba43ef03d495a529de8fb22721c0d0" }) -- a bunch of snippets to use
	use({ "honza/vim-snippets", commit = "ccc2fa1529d372f7ac16d5eb07a385a72b50e05d" }) -- snippet completions
	use({ "quangnguyen30192/cmp-nvim-ultisnips", commit = "24bca5c3e137b28cd87442d4fc51a2b312dd99cc" }) -- snippet completions
	-- use({ "L3MON4D3/LuaSnip", version = "2.*", build = "make install_jsregexp", commit = "c5fb16a934892086d4ba01bac48b77c65435025e" }) --snippet engine
	-- use({ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }) -- snippet completions
	-- use({ "hrsh7th/cmp-nvim-lua", commit = "f12408bdb54c39c23e67cab726264c10db33ada" }) -- snippet completions
	-- use({ "mlaursen/vim-react-snippets", commit = "dbf0c856a8e8889412144d8fdd49837384818c5f" }) -- snippet completions

	-- registers
	use({ "tversteeg/registers.nvim", commit = "f7f7b8a55de10293e2af6002d4da98cbeffc6333" }) -- snippet completions

	-- LSP
	use({ "williamboman/mason.nvim", commit = "5ad3e113b0c3fde3caba8630599373046f6197e8" })
	use({ "williamboman/mason-lspconfig.nvim", commit = "796008869e67ef27a5aa5ac44c08ce2a60b89f55" })
	use({ "neovim/nvim-lspconfig", commit = "a27356f1ef9c11e1f459cc96a3fcac5c265e72d6" }) -- enable LSP

	-- use { "jose-elias-alvarez/null-ls.nvim", commit = "db09b6c691def0038c456551e4e2772186449f35" } -- for formatters and linters

	use({ "mhartington/formatter.nvim", commit = "44c89f09dcc220dc2a9b056e93c3a87c86e79804" }) -- for formatters and linters
	use({ "mfussenegger/nvim-lint", commit = "9b6cb72660114e5f188907be0d866a8ca2b0ef23" }) -- for formatters and linters
	use({ "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "76ea9a898d3307244dce3573392dcf2cc38f340f" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "d94e1ad9575cc211b5726f09b28ca9454aba22fe",
	})
	-- Git
	use({ "lewis6991/gitsigns.nvim", commit = "f98c85e7c3d65a51f45863a34feb4849c82f240f" })

	-- DAP
	use({ "mfussenegger/nvim-dap", commit = "6b12294a57001d994022df8acbe2ef7327d30587" })
	use({ "rcarriga/nvim-dap-ui", commit = "1cd4764221c91686dcf4d6b62d7a7b2d112e0b13" })
	use({ "ravenxrz/DAPInstall.nvim", commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de" })

	-- rainbow-delimiters
	use({ "HiPhish/rainbow-delimiters.nvim", commit = "8c6697b293d44b9bbbbdcf37e200cd01c9b66355" })

	-- HOP
	-- use({ "phaazon/hop.nvim", commit = "6591b3656b75ff313cc38dc662a7ee8f75f1c165" })
	use({ "smoka7/hop.nvim", commit = "f2508f415b9fe34082696009574ca26f57a66531" })

	-- Harpoon
	use({ "ThePrimeagen/harpoon", commit = "21f4c47c6803d64ddb934a5b314dcb1b8e7365dc" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
