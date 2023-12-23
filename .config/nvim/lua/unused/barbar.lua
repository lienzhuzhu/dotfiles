return {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    version = '^1.0.0',

    init = function()
        vim.g.barbar_auto_setup = false
    end,

    config  = function()

        require('barbar').setup({
            animation = false,
            sidebar_filetypes = {
                NvimTree = true,
            }
        })

        vim.keymap.set("n", "_", "<cmd>BufferPrevious<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "+", "<cmd>BufferNext<CR>", { noremap = true, silent = true })

    end
}
