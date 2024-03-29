return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},

    config = function ()

        --vim.opt.list = true
        --vim.opt.listchars = {
        --    eol = "↴"
        --}

        require("ibl").setup({
            indent = {
                char = "▏",
            },
            scope = {
                enabled = false
            }
        })

    end
}
