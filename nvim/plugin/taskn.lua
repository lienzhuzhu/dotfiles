local taskn_module = require("taskn")
vim.keymap.set('n', '<leader>pw', taskn_module.open_window)
vim.keymap.set('n', '<esc>', taskn_module.close_window)
