return {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    --event = "BufReadPre",   -- might be necessary to prevent race conditions

    config = function()

        require("bufferline").setup({
            options = {
                offsets = {
                    {
                        filetype = "neo-tree"
                    },
                    {
                        filetype = "NvimTree",
                        --text = "File Explorer", -- NOTE: this line and the one below are an optional title for nvim-tree when it is open, I prefer no title
                        --text_align = "center",
                    }
                },
                mode = "buffers"    -- THIS IS THE DEFAULT VALUE, PASTED HERE FOR REFERENCE 
                                    -- THIS DEFAULT VALUE REQUIRES THAT nvim-cmp LOADS ON START
            }
        })

        vim.keymap.set("n", "_", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "+", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })

    end
}
