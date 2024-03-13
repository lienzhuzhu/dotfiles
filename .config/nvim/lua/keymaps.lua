vim.g.mapleader = " "

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

vim.keymap.set("n", "<C-x>", "<cmd>bd!<CR>", opts)

-- for some reason these must use the ':' character and not <cmd>
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- greatest remap ever
vim.keymap.set("x", "p", [["_dP]])

vim.keymap.set("n", "<C-t>", "<cmd>terminal<CR>", opts)
vim.keymap.set('t', "<Esc>", [[<C-\><C-n>]], opts)
