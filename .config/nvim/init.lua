vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'user.launch'
require 'user.keymaps'
require 'user.options'
require 'user.netrw'
spec 'user.colorscheme'
spec 'user.devicons'
spec 'user.treesitter'
spec 'user.mason'
spec 'user.lspconfig'
spec 'user.cmp'
spec 'user.none-ls'
spec 'user.whichkey'
spec 'user.telescope'

-- Lazy installer
require 'user.lazy'

-- Nerd font
vim.g.have_nerd_font = true

-- Mis cosas
require 'mis_cosas.tildes'
require 'mis_cosas.toggleJumps'
require 'mis_cosas.my'
require 'snippets.latex_snips'

-- Load filetype-specific settings
-- vim.cmd [[
--   augroup filetypedetect
--     au! BufRead,BufNewFile *.tex setfiletype tex
--   augroup END
-- ]]

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.tex',
  callback = function()
    vim.bo.filetype = 'tex'
  end,
})

-- color
vim.cmd.colorscheme 'kanagawa-dragon'
