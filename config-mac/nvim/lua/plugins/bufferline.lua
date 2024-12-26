return {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
        vim.keymap.set("n", "_", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "+", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
    end,
    opts = function ()
        return {
            options = {
                mode = "buffers",
            }
        }
    end,
}
