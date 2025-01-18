-- config/autocmds.lua
-- Author: Lien Zhu
-- Description: This file sets various autocmds


vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "rmd" }, --TODO: Need to revisit this syntax. I think it might have to be *.Rmd.
    callback = function()
        -- Clear custom indentation and formatting expressions
        vim.opt_local.indentexpr = ""
        vim.opt_local.formatexpr = ""

        -- Optionally, reset related options
        vim.opt_local.autoindent = false
        vim.opt_local.smartindent = false
        vim.opt_local.formatoptions = "" -- Remove all formatting options
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown", -- Trigger only for markdown files
    callback = function()
        -- Set the key mappings for visual line navigation
        vim.keymap.set('n', 'j', 'gj', { buffer = true, noremap = true })
        vim.keymap.set('n', 'k', 'gk', { buffer = true, noremap = true })
        vim.keymap.set('v', 'j', 'gj', { buffer = true, noremap = true })
        vim.keymap.set('v', 'k', 'gk', { buffer = true, noremap = true })
    end,
})

--HACK: Will need to find a better solution.
--      Ideally retain the .Rmd file extension
--      but inherit markdown syntax.
vim.filetype.add({
    extension = {
        Rmd = "markdown",
    },
})
