return {
    "neovim/nvim-lspconfig",
    lazy = false, -- ensure it loads immediately
    dependencies = {
        {
            "hrsh7th/cmp-nvim-lsp"
        },
        {
            "williamboman/mason-lspconfig.nvim"
        },
        {
            "williamboman/mason.nvim",

            config = function()

                local mason = require("mason") -- NOTE: this must run before require("mason-lspconfig") call

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
    },

    config = function()

        local on_attach = function(_, bufnr)
            local opts = { noremap = true, silent = true }
            local keymap = vim.keymap

            opts.buffer = bufnr

            -- set keybinds
            opts.desc = "Show LSP references"
            keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

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

        local servers = {
            lua_ls = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
                        }
                    }
                }
            },
            clangd = {},
            pyright = {},
            marksman = {},
        }

        local cmp_nvim_lsp = require("cmp_nvim_lsp")
        local capabilities = cmp_nvim_lsp.default_capabilities()

        local mason_lspconfig = require("mason-lspconfig")

        mason_lspconfig.setup({
            ensure_installed = vim.tbl_keys(servers),
            automatic_installation = true
        })

        local lspconfig = require("lspconfig")

        mason_lspconfig.setup_handlers {
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                    filetypes = (servers[server_name] or {}).filetypes,
                })
            end,
        }


        --local signs = { Error = "", Warning = "", Hint = "", Information = "" }
        --for type, icon in pairs(signs) do
        --    local hl = "LspDiagnosticsSign" .. type
        --    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        --end

    end
}
