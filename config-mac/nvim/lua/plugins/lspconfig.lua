return {
    "neovim/nvim-lspconfig",
    enabled = false,
    lazy = false,
    dependencies = {
        {
            "williamboman/mason.nvim",
            opts = {
                pip = {
                    upgrade_pip = true,
                },
                ui = {
                    border = "rounded",
                }
            }
        },

        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local mason_lspconfig = require("mason-lspconfig")

        local lspconfig = require("lspconfig") -- NOTE: used in mason_lspconfig.setup_handlers()

        local on_attach = function(_, bufnr)
            local opts = { noremap = true, silent = true }
            local keymap = vim.keymap

            opts.buffer = bufnr

            opts.desc = "Show LSP references"
            keymap.set("n", "<leader>lr", vim.lsp.buf.references, opts)

            opts.desc = "See available code actions"
            keymap.set({ "n", "v" }, "<leader>lca", vim.lsp.buf.code_action, opts)

            opts.desc = "Rename symbol"
            keymap.set("n", "<leader>lR", vim.lsp.buf.rename, opts)

            opts.desc = "Show buffer diagnostics"
            keymap.set("n", "<leader>qbd", function()
                vim.diagnostic.setqflist({ open = true })
            end, opts)

            opts.desc = "Show line diagnostics"
            keymap.set("n", "<leader>qld", vim.diagnostic.open_float, opts)

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts)

            opts.desc = "Show function signature help"
            keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts)
        end


        -- HACK:
        -- Function to dynamically fetch LuaSnip globals
        local function get_luasnip_globals()
            return {
                "s", "t", "i", "f", "c", "d", "r", "sn", "isn",
                "events", "ai", "extras", "l", "rep", "p", "m", "n",
                "dl", "fmt", "fmta", "conds", "postfix", "types", "parse", "ms"
            }
        end

        -- Dynamically fetch LuaSnip globals
        local luasnip_globals = get_luasnip_globals()
        local luasnip_path = vim.fn.stdpath("data") .. "/lazy/LuaSnip" -- Adjust the path based on your plugin manager

        local servers = {
            lua_ls = {
                Lua = {
                    diagnostics = {
                        globals = vim.tbl_extend("force", { "vim" }, luasnip_globals)
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                            [luasnip_path .. "/lua"] = true, -- Add LuaSnip source files to the workspace
                        }
                    }
                }
            },
            pyright = {},
            marksman = {},
        }

        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
            automatic_installation = true
        })

        mason_lspconfig.setup {
            handlers = 
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = require("cmp_nvim_lsp").default_capabilities(),
                        on_attach = on_attach,
                        settings = servers[server_name],
                        filetypes = (servers[server_name] or {}).filetypes,
                    })
                end,
        }


        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = '✘',
                    [vim.diagnostic.severity.WARN] = '▲',
                    [vim.diagnostic.severity.HINT] = '⚑',
                    [vim.diagnostic.severity.INFO] = '»',
                },
            },
        })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
        })

    end
}
