return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function ()
        local ls = require("lazy.status")
        vim.opt.showtabline = 1
        return {
            always_show_tabline = false,
            extensions = {
                "oil",
                "quickfix",
            },
            options = {
                icons_enabled = true,
                theme = "seoul256" ,
                disabled_filetypes = {
                    statusline = { }
                },
                component_separators = '',
                section_separators = '',
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {
                    {
                        "filename",
                        path=1,
                        filetype_names = {
                            fzf = 'FZF',
                            alpha = 'Alpha'
                        },
                    },
                },
                lualine_x = {
                    {
                        ls.updates,
                        cond = ls.has_updates,
                        color = { fg = "#E6C384" },
                    },
                    { "encoding" },
                    { "fileformat" },
                    { "filetype" },
                },
            },
            tabline = {
                lualine_a = {
                    { 'filetype', icon_only = true },
                },
                lualine_b = {
                    {
                        'tabs', mode = 2,
                        max_length = vim.o.columns,
                        filetype_names = {
                            fzf = 'FZF',
                            alpha = 'Alpha'
                        },
                    },
                },
            },
        }
    end,
}
