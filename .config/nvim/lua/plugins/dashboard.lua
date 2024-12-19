return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()

        local function get_art()
            return
                "",
                " ▄▄    ▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄ ▄▄   ▄▄ ",
                "█  █  █ █       █       █  █ █  █   █  █▄█  █",
                "█   █▄█ █    ▄▄▄█   ▄   █  █▄█  █   █       █",
                "█       █   █▄▄▄█  █ █  █       █   █       █",
                "█  ▄    █    ▄▄▄█  █▄█  █       █   █       █",
                "█ █ █   █   █▄▄▄█       ██     ██   █ ██▄██ █",
                "█▄█  █▄▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█ █▄▄▄█ █▄▄▄█▄█   █▄█",
                ""
        end

        require("dashboard").setup({
            theme = 'hyper',
            config = {
                header = {
                    get_art()
                },
                shortcut = {
                    { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
                    {
                        icon = ' ',
                        icon_hl = '@variable',
                        desc = 'Files',
                        group = 'Label',
                        action = 'Telescope find_files',
                        key = 'f',
                    },
                    {
                        desc = ' Man Pages',
                        group = 'Number',
                        action = 'Telescope man_pages',
                        key = 'm',
                    },
                },
            },
        })
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
