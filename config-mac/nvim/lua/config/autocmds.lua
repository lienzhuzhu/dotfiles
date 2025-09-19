-- config/autocmds.lua
-- Author: Lien Zhu
-- Description: This file sets various autocmds

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.keymap.set('n', 'j', 'gj', { buffer = true, noremap = true })
        vim.keymap.set('n', 'k', 'gk', { buffer = true, noremap = true })
        vim.keymap.set('v', 'j', 'gj', { buffer = true, noremap = true })
        vim.keymap.set('v', 'k', 'gk', { buffer = true, noremap = true })
    end,
})

-- Force indentation for specific filetypes if needed
-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = '*',
--   callback = function()
--     vim.bo.shiftwidth = 4
--     vim.bo.tabstop = 4
--   end
-- })
