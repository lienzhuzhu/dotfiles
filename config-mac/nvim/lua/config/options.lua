vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.breakindent = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.virtualedit = "block"

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8

vim.opt.laststatus = require("utils.enums").InfoLines.GLOBAL
vim.opt.showtabline = require("utils.enums").InfoLines.NEVER
vim.opt.showmode = false
vim.opt.cmdheight = 0

vim.opt.background = "dark"
vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.cursorcolumn = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.hidden = false

vim.opt.splitright = true
vim.opt.showtabline = 1

vim.g.python_recommended_style = 0
vim.g.r_recommended_style = 0
vim.g.c_recommended_style = 0
vim.g.cpp_recommended_style = 0
vim.g.markdown_recommended_style = 0
vim.g.rmd_recommended_style = 0
vim.g.scss_recommended_style = 0
vim.g.css_recommended_style = 0
vim.g.sass_recommended_style = 0
