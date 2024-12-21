return {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    --event = "BufReadPre",   -- might be necessary to prevent race conditions
    opts = function ()
        vim.keymap.set("n", "_", "<cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "+", "<cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true })
        return {
            options = {
                -- THIS DEFAULT VALUE REQUIRES THAT nvim-cmp LOADS ON START
                mode = "buffers"    -- THIS IS THE DEFAULT VALUE, PASTED HERE FOR REFERENCE 
            }
        }
    end,
}
