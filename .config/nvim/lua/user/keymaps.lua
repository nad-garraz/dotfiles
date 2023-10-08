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
keymap("n", "noh", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", ":w<cr><cmd>Bdelete!<CR>", opts)

-- illuminate
keymap("n", "<a-n>", '<cmd>lua require("illuminate").next_reference({wrap = true})<cr>', { noremap = true })
keymap("n", "<a-p>", '<cmd>lua require("illuminate").next_reference({wrap = true, reverse = true})<cr>', { noremap = true })

-- Harpoon keymaps
keymap("n", "\\a", "<cmd>lua Harpoon_mark.add_file() <cr>", opts)
keymap("n", "E", "<cmd>lua Harpoon_ui.toggle_quick_menu() <cr>", opts)
keymap("n", "\\1", "<cmd>lua Harpoon_ui.nav_file(1)<cr>", opts)
keymap("n", "\\2", "<cmd>lua Harpoon_ui.nav_file(2)<cr>", opts)
keymap("n", "\\3", "<cmd>lua Harpoon_ui.nav_file(3)<cr>", opts)
keymap("n", "\\4", "<cmd>lua Harpoon_ui.nav_file(4)<cr>", opts)
keymap("n", "\\5", "<cmd>lua Harpoon_ui.nav_file(5)<cr>", opts)
keymap("n", "\\6", "<cmd>lua Harpoon_ui.nav_file(6)<cr>", opts)

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
keymap("v", "J", ":m '>+1<cr>gv=gv")
keymap("v", "K", ":m '<-2<cr>gv=gv")
keymap("n", "J", "mzJ`z")
keymap("n", "N", "Nzzzv")
keymap("n", "<C-d>", "<c-d>zz")
keymap("n", "<C-u>", "<c-u>zz")
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)


-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Terminal
keymap("n", "<c-\\>", ":ToggleTerm<CR>", opts)

-- -- Telescope
keymap("n", "<leader>tf", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>tg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>tp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>tb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>tr", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>tkk", ":Telescope keymaps<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)
keymap("n", "<leader>sc", "<cmd> lua My_shit.see_the_fucking_comments() <CR>", opts)

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

-- FORMATTER
keymap("n", "<leader>lf", "<cmd>Format<cr>", opts)

-- Substitute visual selected
keymap("v", "<leader>ss", '"hy:%s/<c-r>h//gc<left><left><left>')
keymap("n", "<leader>sw", "viw\"hy:%s/<c-r>=expand('<cword>')<cr>//gc<left><left><left>")

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
keymap( "n", "<leader>f", "<cmd>HopChar1<cr>", opts)
keymap( "n", "<leader>fP", "<cmd>HopChar1<cr>", opts)

-- Jumps
keymap("i", "<c-j>", "<esc>/<+.*+><enter>:noh<cr><esc>cf>", {silent = true, noremap = true})
keymap("i", "()", "()<++><esc>F)i", opts)
keymap("i", "[]", "[]<++><Esc>F]i", opts)
keymap("i", "{}", "{}<++><Esc>F}i", opts)
keymap("i", '""', '""<++><Esc>F"i', opts)
keymap("i", "''", "''<++><Esc>F'i", opts)
keymap("i", "<>", "<><++><Esc>F>i", opts)

-- Tildes
keymap("n", "<leader>tt", "<cmd>lua require('tildes').ToggleTildes()<enter>", opts)

-- Yo mama
keymap("n", "ym", "<cmd>lua print(My_shit.pete())<cr>", opts)

-- save and quit
keymap("n", "<leader>wq", ":wq<enter>", opts)
keymap('n', "<leader>ww", ":w<enter>", opts)

-- Toggle WRAP
keymap("n", "<leader>tw", ":set invwrap<enter>", opts)

-- SPELL CHECKING
keymap("n", "\\eng", ":setlocal spell! spelllang=en_us<enter>", opts)
keymap("n", "\\esp", ":setlocal spell! spelllang=es_ar<enter>", opts)
