return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            char = "▏",
        },
        scope = {
            enabled = false
        },
        exclude = {
            filetypes = { "dashboard" },
        },
    },
    init = function ()
        --vim.opt.list = true
        --vim.opt.listchars = {
        --    eol = "↴"
        --}
    end
}
