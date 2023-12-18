return {
    'akinsho/bufferline.nvim', 
    dependencies = { {'nvim-tree/nvim-web-devicons'} }, 

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

        vim.keymap.set("n", "<leader>[", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>]", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })

    end
}
