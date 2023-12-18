return {
    'akinsho/bufferline.nvim', 
    dependencies = { 'nvim-tree/nvim-web-devicons' }, 

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

        vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })

    end
}
