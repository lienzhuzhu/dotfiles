return {
    "lienzhuzhu/r2pdf.nvim",
    enabled = true,
    dev = true,
    opts = function ()
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<leader>rp", "<cmd>R2PDF<CR>", opts)

        return {}
    end

}
