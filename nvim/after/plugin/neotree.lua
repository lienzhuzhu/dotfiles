require("neo-tree").setup({
    close_if_last_window = true,
    filesystem = {
        hijack_netrw_behavior = "open_default"
    }
})

vim.keymap.set("n", "<leader>t", ":Neotree toggle<CR>")
