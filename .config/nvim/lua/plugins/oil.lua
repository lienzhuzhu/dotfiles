return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function ()
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<leader>t", "<cmd>Oil<CR>", opts)
    end
}
