local ntime_module = require("ntime")
vim.keymap.set('n', '<leader>pt', ntime_module.show_ntime)
vim.keymap.set('n', '<leader>pw', ntime_module.open_window)
