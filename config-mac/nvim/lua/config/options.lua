vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 8

vim.opt.laststatus = require("utils.enums").InfoLines.GLOBAL
vim.opt.showtabline = require("utils.enums").InfoLines.NEVER
vim.opt.showmode = false

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"

vim.opt.swapfile = false

vim.opt.clipboard = "unnamedplus"

vim.opt.shortmess:append("c")
vim.opt.shortmess:append("a")
vim.opt.shortmess:append("F")
vim.opt.shortmess:append("I")

vim.opt.splitright = true
