require('plugins')

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.o.relativenumber = true
vim.o.number = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.wrap = false

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.scrolloff = 8
