"======================
"Vibhav Tuteja's .vimrc
"======================

set encoding=utf-8

"------------------------
"Insert mode block cursor
"------------------------
set guicursor=i:block

"------
"Leader
"------
let mapleader = " "

"----------
"Highlights
"----------
set cursorline
:highlight Cursorline cterm=bold ctermbg=black
set showmatch
set incsearch
set nohls

"------------------------
"Show line numbers in vim
"------------------------
set number
set numberwidth=3
set relativenumber

"--------------------------------------------
"Buffer before cursor reaches bottom of screen
"--------------------------------------------
set scrolloff=8

"----------------------------------
"Show title of the file in terminal
"----------------------------------
set title

"-------------------
"Enable Code Folding
"-------------------
set foldmethod=indent
set foldlevel=99 

"------------------
"Auto line wrapping
"------------------
set wrap

"------------
"Tab setting
"------------
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab

"--------------
"Mouse settings
"--------------
"set mouse=nicr

"-------------------
"Vim - plugs section -- add Plug 'x' under here 
"-------------------

call plug#begin('~/.vim/pluggies')

	Plug 'ghifarit53/tokyonight-vim'
	"--theme
	
	Plug 'sainnhe/everforest'
	"--theme everforest

	Plug 'sheerun/vim-polyglot'
	"--language pack for indentation support and syntax highlighting

	Plug 'ervandew/supertab'
	"auto complete on tab

	Plug 'Raimondi/delimitMate'
	"auto bracket completer
	
	Plug 'junegunn/fzf'
	Plug 'junegunn/fzf.vim'
	"fuzzy finder
	
	Plug 'itchyny/vim-gitbranch'
	"get git branch name with gitbranch#name
	
	Plug 'neovim/nvim-lspconfig'
	"lsp config

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

"----------------
"kitty background -- not displaying properly
"----------------

let &t_ut=''

"------------
"FZF Settings
"------------

noremap <leader>f :Ag<CR>

"popup layout settings 
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.7, 'highlight': 'Comment' } }

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

"---------------
"INSERT mode QoL
"---------------

"Go to start and end of line when in insert mode

inoremap <C-h> <C-o>^
inoremap <C-l> <C-o>$

"---------
"Functions
"---------
 "add function to print y in statusline only when git branch is found"
 "learn lua ;)
 
 "Python LSP
lua << EOF
require("lspconfig").pylsp.setup{
	on_attach = function() 
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
	end,
}
EOF

"----------------
"Status line mods
"----------------

set laststatus=2
set statusline=
set statusline+=%#PmenuSel#
set statusline+=.:
set statusline+=%{gitbranch#name()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\

