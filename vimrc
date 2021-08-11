"======================
"Vibhav Tuteja's .vimrc
"======================

"------------------------
"show line numbers in vim
"------------------------

set number
set numberwidth=3

"----------------------------------
"show title of the file in terminal
"----------------------------------

set title

"-------------------
"Vim - plugs section -- add Plug 'x' under here 
"-------------------

call plug#begin('~/.vim/pluggies')

	Plug 'ghifarit53/tokyonight-vim'
	"--theme

	Plug 'sheerun/vim-polyglot'
	"--language pack for indentation support and syntax highlighting

	Plug 'ervandew/supertab'
	"auto complete on tab

	Plug 'Raimondi/delimitMate'
	"auto bracket completer

call plug#end()

"------------------------
"tokyonight colour scheme
"------------------------

set termguicolors

let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

"-------------------------
"vim-polyglot dependencies
"-------------------------

set nocompatible

"-------------------
"syntax highlighting -- always on
"-------------------

filetype plugin on
syntax on

"------------------
"Auto line wrapping
"------------------
set wrap
set textwidth=132

"----------------
"kitty background -- not displaying properly
"----------------

let &t_ut=''

"------
"Ctrl P
"------

set runtimepath^=~/.vim/bundle/ctrlp.vim

"--------------
"VIM Splits QoL
"--------------

set splitbelow splitright "Splits open on the right and below"

"navigate splits in vim

map <C-j> <C-w><up>
map <C-k> <C-w><down>
map <C-h> <C-w><left>
map <C-l> <C-w><right>

"Make adjusing split sizes a bit more friendly with up left down right arrowkeys

noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

