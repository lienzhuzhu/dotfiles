return {
    "neovim/nvim-lspconfig",
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
        "hrsh7th/cmp-nvim-lsp"
    },
    config = function()

        local mason_lspconfig = require("mason-lspconfig")

        local lspconfig = require("lspconfig") -- NOTE: used in mason_lspconfig.setup_handlers()

        local on_attach = function(_, bufnr)
            local opts = { noremap = true, silent = true }
            local keymap = vim.keymap

            opts.buffer = bufnr

            -- set keybinds
            opts.desc = "Show LSP references"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

            opts.desc = "Go to declaration"
            keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

            opts.desc = "Show LSP definitions"
            keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

            opts.desc = "Show LSP implementations"
            keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

            opts.desc = "Show LSP type definitions"
            keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

            opts.desc = "See available code actions"
            keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

            opts.desc = "Smart rename"
            keymap.set("n", "gr", vim.lsp.buf.rename, opts)

            opts.desc = "Show buffer diagnostics"
            keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

            opts.desc = "Show line diagnostics"
            keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

            opts.desc = "Go to previous diagnostic"
            keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

            opts.desc = "Go to next diagnostic"
            keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

            opts.desc = "Show documentation for what is under cursor"
            keymap.set("n", "K", vim.lsp.buf.hover, opts)
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

        mason_lspconfig.setup_handlers {
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                    on_attach = on_attach,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                })
            end,
        }

        local signs = {
            Error = "",
            Warn = "",
            Hint = "",
            Info = ""
        }

        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "rounded",
        })

    end
}
