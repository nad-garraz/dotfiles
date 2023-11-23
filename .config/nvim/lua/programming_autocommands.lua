-- c++ compile and execute
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "cpp" },
	callback = function()
		vim.cmd([[
    nnoremap <leader>cc <Esc>:w<Enter>:!g++ -Wunused-variable -Wall -pedantic "%" -o "%:r.out" -g<Enter>
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "cpp" },
	callback = function()
		vim.cmd([[ 
    nnoremap <leader>mc <Esc>:wa<Enter>:!g++ -Wunused-variable -pedantic -Wall *cpp *h -o %:r.out -g && time ./"%:r.out"<Enter>
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "cpp" },
	callback = function()
		vim.cmd([[ 
    nnoremap <leader>rr :2TermExec cmd='time ./"%:r.out"'<Enter>
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
--
-- JSl
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.js" },
	callback = function()
		vim.cmd([[ 
          nnoremap <leader>rr <Esc>:w <bar> :!node %<Enter>
    ]])
	end,
})

