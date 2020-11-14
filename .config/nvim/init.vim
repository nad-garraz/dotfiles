" _   ___     _____ __  __ ____   ____
"| \ | \ \   / /_ _|  \/  |  _ \ / ___|
"|  \| |\ \ / / | || |\/| | |_) | |
"| |\  | \ V /  | || |  | |  _ <| |___
"|_| \_|  \_/  |___|_|  |_|_| \_\\____|
"


" Basics
set norelativenumber
set nonumber
set encoding=utf-8
set clipboard=unnamedplus
set laststatus=1
" Muestra whitespaces y tabs
set list

" Source functions file
source $HOME_CONFIG/nvim/random_functions.vim

" Splits spawns right and at the bottom
set splitright
set splitbelow

" Tabbing
set shiftwidth=2
set softtabstop=2
set tabstop=2

set path=.,,**

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" Update binds when sxhkd is saved
autocmd BufWritePost *sxhkdrc !/home/test/.local/scripts/restart/restart_sxhkd

" Update binds when sxhkd is saved
autocmd BufWritePost *dunstrc !/home/test/.local/scripts/restart/restart_dunst

" MAKE CLEAN INSTALL FOR DWM is saved
autocmd BufWritePost ~/.local/src/dwm/config.h !cd ~/.local/src/dwm ; make clean install; killall dwm

" MAKE CLEAN INSTALL FOR DWMBLOCKS is saved
autocmd BufWritePost ~/.local/src/dwmblocks/blocks.h !cd ~/.local/src/dwmblocks; make clean install && { killall -q dwmblocks; setsid dwmblocks & }



" Spell-check English
map <leader>eng :setlocal spell! spelllang=en_us<CR>

" Spell-check Spanish
map <leader>esp :setlocal spell! spelllang=es_ar<CR>

" Align all, indentation
nmap <Leader>al ggVG=``zz<CR>

" Call TILDES
imap <Leader>ti <Esc>:call ToggleTildes()<CR>a
call ToggleTildes()

" Call ToggleSideNumbers
noremap <Leader>nu <Esc>:call ToggleSideNumbers()<CR>
" Plugins
source $HOME_CONFIG/nvim/plugins.vim

" Case insensitive
set ignorecase

" Mouse activated in all (a) modes
set mouse=a

" Coordinates lines
set cursorline
"set cursorcolumn

" \s --> substitute, the expression <c-r><c-w> has own meaning see :help <c-r><c-w>
nnoremap <Leader>s :%s/<c-r><c-w>//gc<Left><Left><Left>

" Make all appearences of the word UPPER
nnoremap <Leader>u :%s/\(<c-r><c-w>\)/\U\1/g<CR>:noh<CR>

" UltiSnips files
" Make all appearences of the word LOWER
nnoremap <Leader>l :%s/\(<c-r><c-w>\)/\L\1/g<CR>

let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

" Python exec
autocmd FileType python noremap <buffer> <leader>pp <Esc>:w<CR> :exec '!python' shellescape(@%,1)<CR>

" C exec
autocmd filetype c nnoremap <leader>co <Esc>:w <bar> :exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
"autocmd FileType *.c remap <buffer> <leader>co <Esc>:w<CR> :exec '!gcc %'<CR>

" Mis tan usados y amados jumps.
imap <C-J> <Esc>/<++><CR>:noh<CR><Esc>cf>
inoremap () ()<++><Esc>F)i
inoremap [] []<++><Esc>F]i
inoremap {} {}<++><Esc>F}i
inoremap "" ""<++><Esc>F"i
inoremap '' ''<++><Esc>F'i
inoremap <> <><++><Esc>F>i


" FZF
map <Leader><Leader>F :FZF ~

" Latex-Suite
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_ViewRule_pdf='zathura'

"
" Automatically B => W => P command
"
" Remove ALL autocommands for the current group.
"augroup configs
"	autocmd!
"	autocmd BufWritePost .bash* !source <afile>
"augroup END

"autocmd BufWritePost init.vim :source <sfile>
"
"
"

 "This is the default extra key bindings
    "let g:fzf_action = {
      "\ 'ctrl-t': 'tab split',
      "\ 'ctrl-x': 'split',
      "\ 'ctrl-v': 'vsplit' }
