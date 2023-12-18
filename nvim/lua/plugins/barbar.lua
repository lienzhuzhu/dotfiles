return {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',
        'nvim-tree/nvim-web-devicons',
    },

    init = function()

        vim.g.barbar_auto_setup = false

        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        -- Move to previous/next
        map('n', '_', '<Cmd>BufferPrevious<CR>', opts)
        map('n', '+', '<Cmd>BufferNext<CR>', opts)

    end,

    opts = {
        animation = false,
        sidebar_filetypes = {
            NvimTree = true,
        }
    },
    version = '^1.0.0',
}
