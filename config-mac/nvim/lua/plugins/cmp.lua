return {
    "hrsh7th/nvim-cmp",
    lazy = false, -- MUST LOAD IN IMMEDIATELY TO PREVENT RACE CONDITION WITH BUFFERLINE
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets"
    },

    config = function()

        local cmp = require("cmp")
        local luasnip = require("luasnip")
        luasnip.config.set_config({
            enable_autosnippets = true, -- Enable auto-snippets globally
        })
        require("luasnip.loaders.from_vscode").lazy_load()

        require("luasnip.loaders.from_lua").load({
            --paths = (os.getenv("XDG_CONFIG_HOME") or "~/.config/") .. "/nvim/luasnippets" -- NOTE: Default path, so not necessary to specify path
        })

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<C-e>"] = cmp.mapping.abort(), -- NOTE: very useful.

                --["<C-Space>"] = cmp.config.disable, -- NOTE: cmp.mapping.complete() opens the completion menu if it's not already open, useless and collides with tmux prefix.
                ["<CR>"] = cmp.mapping.confirm(),

                ["<Tab>"] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then
                            cmp.confirm({ select = true })
                            --if #cmp.get_entries() == 1 then
                            --    cmp.confirm({ select = true })
                            --else
                            --    cmp.select_next_item()
                            --end
                        elseif luasnip.expandable() then
                            luasnip.expand()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s", }),

                ["<S-Tab>"] = cmp.mapping(
                    function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s", }),

            }),
            experimental = {
                ghost_text = true
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- cmp-nvim-lsp in LSP specification
                { name = "luasnip" }, -- cmp_luasnip
                { name = "buffer" }, -- cmp-buffer
                { name = "path" }, -- cmp-path
            })
        })

    end
}
