return {
    "nvim-telescope/telescope.nvim", tag = "0.1.2",
    dependencies = { {"nvim-lua/plenary.nvim"} },

    config = function()

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>f', builtin.find_files, {})
        vim.keymap.set('n', '<leader>r', builtin.git_files, {})
        vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>s', builtin.grep_string, {})

    end
}
