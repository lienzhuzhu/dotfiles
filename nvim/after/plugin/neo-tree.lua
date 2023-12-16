require("neo-tree").setup({
    close_if_last_window = true,
    window = {
        mappings = {
            ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
        }
    }
})

vim.keymap.set("n", "<leader>t", ":Neotree toggle<CR>")
