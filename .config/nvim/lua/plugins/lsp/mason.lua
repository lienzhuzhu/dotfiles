return {
    "williamboman/mason.nvim",
    lazy = false, -- ensure it loads immediately
    config = function()
        local mason = require("mason")

        mason.setup({
            pip = {
                upgrade_pip = true,
            },
            ui = {
                --border = "rounded",
            }
        })

    end
}
