return {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
        animation = false,
        sidebar_filetypes = {
            NvimTree = true,
        }
    },
    version = '^1.0.0',
}
