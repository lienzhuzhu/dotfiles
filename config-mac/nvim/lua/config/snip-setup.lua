require("luasnip.loaders.from_lua").load({
    paths = (os.getenv("XDG_CONFIG_HOME") or "~/.config/") .. "/nvim/luasnippets"
})
