return {
    "lienzhuzhu/r2pdf.nvim",
    enabled = true,
    dev = true,
    ft = "rmd",
    opts = {},
    init = function ()
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<leader>rp", "<cmd>R2PDF<CR>", opts)
    end

}
