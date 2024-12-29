return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function ()
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<leader>t", "<cmd>Oil<CR>", opts)

        return {
            view_options = {
                is_always_hidden = function(name, _)
                    return
                        vim.endswith(name, ".pdf") or
                        vim.endswith(name, ".aux") or
                        vim.endswith(name, ".out") or
                        vim.endswith(name, ".fls") or
                        vim.endswith(name, ".synctex.gz") or
                        vim.endswith(name, ".toc") or
                        vim.endswith(name, ".fdb_latexmk") or
                        vim.endswith(name, ".git")
                end,
            }
        }
    end
}
