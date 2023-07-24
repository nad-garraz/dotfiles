-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>mn", "<cmd>lua require('nvim-tree.api').marks.navigate.next()<CR>", opts)
keymap("n", "<leader>mp", "<cmd>lua require('nvim-tree.api').marks.navigate.prev()<CR>", opts)
keymap("n", "<leader>ms", "<cmd>lua require('nvim-tree.api').marks.navigate.select()<CR>", opts)

-- Terminal
keymap("n", "<c-\\>", ":ToggleTerm<CR>", opts)

-- -- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts) 
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- Substitute visual selected
keymap("v", "<leader><leader>s", "\"hy:%s/<C-r>h//gc<left><left><left>")

-- Tabs/buffers
keymap("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", opts)
keymap("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", opts)
keymap("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", opts)
keymap("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", opts)
keymap("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", opts)
keymap("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", opts)
keymap("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", opts)
keymap("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", opts)
keymap("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", opts)

-- Hop
keymap('n', 'f', "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
keymap('n', 'F', "<cmd>lua require('hop').hint_char1({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})

-- Jumps
keymap('i', '<c-j>', '<esc>/<+.*+><enter>:noh<cr><esc>cf>', opts)
keymap('i', '()', '()<++><esc>F)i', opts)
keymap('i', '[]', '[]<++><Esc>F]i', opts)
keymap('i', '{}', '{}<++><Esc>F}i', opts)
keymap('i', '""', '""<++><Esc>F"i', opts)
keymap('i', "''", "''<++><Esc>F'i", opts)
keymap('i', '<>', '<><++><Esc>F>i' ,opts)

-- Tildes
keymap('n', '<leader>tt', "<cmd>lua require('tildes').ToggleTildes()<enter>" ,opts)

-- Yo mama
keymap("n", "ym", "<cmd>lua print(T.pete())<cr>", opts)

-- save and quit
keymap("n", "wq", ":wq<enter>", opts)
keymap("n", "\\ww", ":w<enter>", opts)
keymap("i", "\\ww", "<esc>:w<enter>a", opts)

-- Toggle WRAP
keymap("n", "<leader>tw", ":set invwrap<enter>", opts)

-- SPELL CHECKING
keymap("n", '\\eng', ":setlocal spell! spelllang=en_us<enter>", opts)
keymap("n", '\\esp', ":setlocal spell! spelllang=es_ar<enter>", opts)
