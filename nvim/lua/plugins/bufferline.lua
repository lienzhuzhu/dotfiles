return {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    --event = "BufReadPre",   -- might be necessary to prevent race conditions

    config = function()

        require("bufferline").setup({
            options = {
                offsets = {
                    {
                        filetype = "NvimTree"
                    }
                },
                mode = "buffers"    -- THIS IS THE DEFAULT VALUE, PASTED HERE FOR REFERENCE 
                                    -- MUST BE SET TO THIS DEFAULT VALUE TO PREVENT RACE CONDITION WITH NVIM-CMP
            }
        })

        vim.keymap.set("n", "_", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "+", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })

    end
}
