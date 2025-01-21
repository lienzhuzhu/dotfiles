return {
    "goolord/alpha-nvim",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        local button = dashboard.button
        local section = dashboard.section
        section.header.val = {
            [[                                                                       ]],
            [[  ██████   █████                   █████   █████  ███                  ]],
            [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
            [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
            [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
            [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
            [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
            [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
            [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
            [[                                                                       ]],
        }

        section.buttons.val = {
            -- button("f", "  Find file",
            -- ":Telescope find_files hidden=true no_ignore=true<CR>"),
            button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            button("c", "  Configuration",
            ":e ~/.config/nvim/init.lua <CR>"),
            button("u", "  Update plugins", ":Lazy sync<CR>"),
            button("q", "󰈆  Quit", ":qa<CR>")
        }
        section.footer.val = require 'alpha.fortune'()
        alpha.setup(dashboard.opts)
    end
}
