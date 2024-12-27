require("luasnip").config.set_config({
    enable_autosnippets = true, -- Enable auto-snippets globally
})

require("luasnip.loaders.from_lua").load({
    paths = (os.getenv("XDG_CONFIG_HOME") or "~/.config/") .. "/nvim/luasnippets"
})
