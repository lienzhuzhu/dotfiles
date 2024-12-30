return {
    "lienzhuzhu/r2pdf.nvim",
    enabled = true,
    dev = true,
    init = function ()
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<leader>rp", "<cmd>R2PDF render<CR>", opts)
    end,
    opts = function ()
        return {}
    end

}
