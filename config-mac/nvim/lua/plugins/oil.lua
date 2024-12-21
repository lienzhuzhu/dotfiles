return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function ()
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<leader>t", "<cmd>Oil<CR>", opts)

        return {}
    end
}
