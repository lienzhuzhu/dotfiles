return {
    "williamboman/mason.nvim",
    lazy = false, -- ensure it loads immediately
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({
            --pip = {
            --    upgrade_pip = true,
            --},
            ui = {
                border = "single",
            }
        })

        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "clangd",
            },
            automatic_installation = true
        })
    end
}
