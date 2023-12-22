-- c++ compile and execute
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "cpp" },
	callback = function()
		vim.cmd([[
    nnoremap <leader>cc <Esc>:silent w<Enter>:6TermExec cmd="g++ % -o %:r.out -std=c++17 -Wunused-variable -pedantic -Wall -g && ./%:r.out"<Enter>
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

-- Lua
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "lua" },
	callback = function()
		vim.cmd([[ 
    nnoremap <leader>cc <Esc>:w <Enter> :!time lua % <Enter>
    ]])
	end,
})

-- Python
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "python" },
	callback = function()
		vim.cmd([[ 
    nnoremap <leader>rr <esc>:w<enter>:2TermExec cmd='time python %'<Enter>
    ]])
	end,
})

-- Latex
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "tex" },
	callback = function()
		vim.cmd([[ 
          nnoremap <leader>cc <Esc>:w <bar> :!pdflatex % <Enter>
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "tex" },
	callback = function()
		vim.cmd([[ 
        nnoremap <leader>rr <Esc>:!zathura %:r.pdf & <Enter>
      ]])
	end,
})

-- HTML
-- vim.api.nvim_create_autocmd({ "FileType" }, {
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.html" },
	callback = function()
		vim.cmd([[ 
          nnoremap <leader>rr <Esc>:w <bar> :!brave --new-window %<Enter>
    ]])
	end,
})
--gle = index * 2 * pi / getPointCoun
-- Js
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.js" },
	callback = function()
		vim.cmd([[ 
          nnoremap <leader>rr <Esc>:w <bar> :!node %<Enter>
    ]])
	end,
})

-- RUST V=(°°)=V 
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "rust" },
	callback = function()
		vim.cmd([[ 
        nnoremap <leader>rr <Esc>:wa <bar>:5TermExec go_back=0 cmd="cargo run %"<Enter>
      ]])
	end,
})



vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "cpp" },
	callback = function()
		vim.cmd([[
    nnoremap <leader>cs <Esc>:w<Enter>:6TermExec cmd="g++ -c main.cpp && g++ main.o -o sfml-app -lsfml-graphics -lsfml-window -lsfml-system && ./sfml-app"<Enter>
    ]])
	end,
})
