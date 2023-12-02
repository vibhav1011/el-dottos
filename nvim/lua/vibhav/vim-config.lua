-- main vim rc vim.opttings
-- ====================

vim.opt.encoding = "utf-8"

-- vim.opt insert mode block cursor
vim.opt.guicursor = ""

-- highlights
vim.opt.cursorline = true
vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.cmd(":highlight Cursorline cterm=bold ctermbg=black")
vim.opt.colorcolumn = "120"

-- line number vim.opttings
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.relativenumber = true


-- vim.opt scrolloff
vim.opt.scrolloff = 8


-- Show title of the file in terminal
vim.opt.title = true

-- Enable Code Folding
-- vim.opt.foldmethod = "indent"
-- vim.opt.foldlevel = 99
vim.opt.foldmethod= "expr"
vim.opt.foldexpr= "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- Auto line wrapping
vim.opt.wrap = true

-- Tab vim.optting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smarttab = true

-- gui colors
vim.opt.termguicolors = true

-- fast update time
vim.opt.updatetime = 700

vim.opt.compatible = false

--compe pre-requisites
vim.o.completeopt = "menuone,noselect"

-- spellcheck
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
