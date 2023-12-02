-- lua code for calling vim-plug
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'ghifarit53/tokyonight-vim'
--theme

Plug 'cpea2506/one_monokai.nvim'
-- one monokai theme
--
Plug 'rmehri01/onenord.nvim'
-- one nord theme

Plug('nvim-treesitter/nvim-treesitter', {
  ['do'] = function()
    vim.call(':TSUpdate')
  end
})
-- better syntax highlighting

Plug 'Raimondi/delimitMate'
-- auto bracket completer

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
-- fuzzy finder

Plug 'itchyny/vim-gitbranch'
-- get git branch name with gitbranch#name

Plug ('williamboman/mason.nvim', {['do'] =':MasonUpdate'})
-- my lsp just isn't fast enough


Plug 'neovim/nvim-lspconfig'
-- lsp config

Plug 'airblade/vim-gitgutter'
-- git changes in gutter

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
-- auto complete


Plug 'tpope/vim-commentary'
-- gc to comment lines

Plug 'mfussenegger/nvim-dap'

Plug 'rcarriga/nvim-dap-ui'
-- debugger adapter protocol

Plug 'lukas-reineke/indent-blankline.nvim'
-- lines in indents to show context for long functions

Plug 'seblj/nvim-tabline'
-- nice tabs

vim.call('plug#end')

