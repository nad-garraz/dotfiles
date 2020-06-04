" ____                 _
"|  _ \ __ _ _ __   __| | ___  _ __ ___
"| |_) / _` | '_ \ / _` |/ _ \| '_ ` _ \
"|  _ < (_| | | | | (_| | (_) | | | | | |
"|_| \_\__,_|_| |_|\__,_|\___/|_| |_| |_|
"
" _____                 _   _
"|  ___|   _ _ __   ___| |_(_) ___  _ __  ___
"| |_ | | | | '_ \ / __| __| |/ _ \| '_ \/ __|
"|  _|| |_| | | | | (__| |_| | (_) | | | \__ \
"|_|   \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
"
"=====================================================
" ____  _     _      _   _                 _
"/ ___|(_) __| | ___| \ | |_   _ _ __ ___ | |__   ___ _ __
"\___ \| |/ _` |/ _ \  \| | | | | '_ ` _ \| '_ \ / _ \ '__|
" ___) | | (_| |  __/ |\  | |_| | | | | | | |_) |  __/ |
"|____/|_|\__,_|\___|_| \_|\__,_|_| |_| |_|_.__/ \___|_|
"

" Initialize toggleVariable
let g:SideNumbersOn=0

" Toggle functionality
function! ToggleSideNumbers()
	if !g:SideNumbersOn
		set nu relativenumber
		let g:SideNumbersOn=1
	else
		set nonu norelativenumber
		let g:SideNumbersOn=0
	endif
endfunction
"=====================================================
" _   _ _     _
"| |_(_) | __| | ___  ___
"| __| | |/ _` |/ _ \/ __|
"| |_| | | (_| |  __/\__ \
" \__|_|_|\__,_|\___||___/
"

" Initialize toggleVariable
let g:TILDESOn=0
" Toggle functionality
function! ToggleTILDES()
	if !g:TILDESOn
		call TILDES()
	else
		call TILDESOFF()
	endif
endfunction

" Mapping keys
function! TILDES()
	echo "TILDES macros activated"
	let g:TILDESOn=1
	inoremap [a á
	inoremap [A Á
	inoremap [e é
	inoremap [E É
	inoremap [i í
	inoremap [I Í
	inoremap [o ó
	inoremap [O Ó
	inoremap [u ú
	inoremap [U Ú
	inoremap {u ü
	inoremap [n ñ
	inoremap [N Ñ
	inoremap ?? ¿
	inoremap !! ¡
endfunction

"Unmapping keys
function! TILDESOFF()
	echo "TILDES macros deactivated"
	let g:TILDESOn=0
	iunmap [a
	iunmap [A
	iunmap [e
	iunmap [E
	iunmap [i
	iunmap [I
	iunmap [o
	iunmap [O
	iunmap [u
	iunmap [U
	iunmap {u
	iunmap [n
	iunmap [N
	iunmap ??
	iunmap !!
endfunction
"=====================================================
