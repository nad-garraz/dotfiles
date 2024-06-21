-- ========
-- c++ compile and execute
-- ========
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "cpp" },
	callback = function()
		vim.cmd([[
    nnoremap <leader>cc <Esc>:silent wa<Enter>:6TermExec cmd="make clean run"<Enter>
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "cpp" },
	callback = function()
		vim.cmd([[ 
    nnoremap <leader>mc <Esc>:wa<Enter>:5TermExec cmd="g++ -std=c++17 -Wunused-variable -pedantic -Wall *cpp *h -o %:r.out -g"<Enter>
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "cpp" },
	callback = function()
		vim.cmd([[ 
        nnoremap <leader>rr <Esc>:4TermExec go_back=0 cmd="./%:r.out"<Enter>
    ]])
	end,
})

-- compila usando el SFML libraries, etc.
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "cpp" },
	callback = function()
		vim.cmd([[
    nnoremap <leader>cs <Esc>:w<Enter>:6TermExec cmd="g++ -c main.cpp && g++ main.o -o sfml-app -lsfml-graphics -lsfml-window -lsfml-system && ./sfml-app"<Enter>
    ]])
	end,
})

-- ========
-- LUA
-- ========
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "lua" },
	callback = function()
		vim.cmd([[ 
    nnoremap <leader>cc <Esc>:w <Enter> :!time lua % <Enter>
    ]])
	end,
})

-- ========
-- PYTHON
-- ========
vim.api.nvim_create_autocmd({ "FileType" }, {
  desc = 'Runs python in current file',
	pattern = { "python" },
	callback = function()
		vim.cmd([[ 
    nnoremap <leader>rr <esc>:w<enter>:2TermExec cmd='time python %'<Enter>
    ]])
	end,
})
-- Abrir consola y cargar los modulos
vim.api.nvim_create_autocmd({ "FileType" }, {
  desc = 'Opens python console loading current file.',
	pattern = { "python" },
	callback = function()
		vim.cmd([[
    nnoremap <leader>ri <Esc>:w <bar> cd %:p:h <bar> 5TermExec go_back=0 cmd="python -i %"<Enter>
    ]])
	end,
})

-- Actualizar el módulo -- escribe import "modulo en cuestión" a la consola
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "python" },
	callback = function()
		vim.cmd([[
    nnoremap <leader>rl <Esc>:w <bar> cd %:p:h <bar> 5TermExec go_back=0 cmd="import %:r"<Enter>
    ]])
	end,
})

-- ========
-- Latex
-- ========
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "tex" },
	callback = function()
		vim.cmd([[ 
          nnoremap <leader>cc <Esc>:w <bar> :cd %:p:h <bar> :!pdflatex % <Enter>
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "tex" },
	callback = function()
		vim.cmd([[ 
        nnoremap <leader>rr <Esc>:cd %:p:h <bar> !zathura %:r.pdf & <Enter>
      ]])
	end,
})

-- ========
-- HTML
-- ========
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.html" },
	callback = function()
		vim.cmd([[ 
          nnoremap <leader>rr <Esc>:w <bar> :!brave --new-window %<Enter>
    ]])
	end,
})

--
-- ========
-- Js
-- ========
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.js" },
	callback = function()
		vim.cmd([[ 
          nnoremap <leader>rr <Esc>:w <bar> :!node %<Enter>
    ]])
	end,
})

-- ========
-- RUST V=(°°)=V
-- ========
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "rust" },
	callback = function()
		vim.cmd([[ 
        nnoremap <leader>rr <Esc>:wa <bar>:5TermExec go_back=0 cmd="cargo run %"<Enter>
      ]])
	end,
})

-- ========
-- HASKELL
-- ========
-- Compila haskell
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "haskell", "*hs" },
	callback = function()
		vim.cmd([[
    nnoremap <leader>cc <Esc>:w<bar>:cd %:p:h <bar>:3TermExec cmd="ghc %"<Enter>
    ]])
	end,
})

-- ejecuta haskell
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "haskell", "*hs" },
	callback = function()
		vim.cmd([[
    nnoremap <leader>rr <Esc>:cd %:p:h <bar> 3TermExec cmd="./%:r"<Enter>
    ]])
	end,
})

-- ejecuta haskell ghci
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "haskell", "*hs" },
	callback = function()
		vim.cmd([[
    nnoremap <leader>ri <Esc>:w <bar> cd %:p:h <bar> 5TermExec go_back=0 cmd="ghci %"<Enter>
    ]])
	end,
})

-- reload file in ghci
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "haskell", "*hs" },
	callback = function()
		vim.cmd([[
    nnoremap <leader>rl <Esc>:w <bar> cd %:p:h <bar> 5TermExec go_back=0 cmd=":l %"<Enter>
    ]])
	end,
})
