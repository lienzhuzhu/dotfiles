return {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "BufReadPre",
    config = function()

        require("bufferline").setup({
            options = {
                offsets = {
                    {
                        filetype = "NvimTree"
                    }
                }
            }
        })

        vim.keymap.set("n", "_", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "+", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })

    end
}
