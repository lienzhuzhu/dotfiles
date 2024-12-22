-- config/autocmds.lua
-- Author: Lien Zhu
-- Description: This file sets various autocmds


vim.api.nvim_create_autocmd("FileType", {
    pattern = { "markdown", "rmd" },
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
