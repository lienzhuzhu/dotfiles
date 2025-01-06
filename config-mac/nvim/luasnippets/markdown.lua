-- luasnippets/markdown.lua
-- Description: Snippets exclusive for Markdown and R Markdown files.


return {
	s("hw", t("hello world of luasnip")),
    s({
        trig="vb",
        dscr="Inserts a vertical break",
        regTrig=false,
        priority=1000,
        snippetType="autosnippet"
    },
    {
        t({"", "<br>", "", ""}),
        i(0),
    })
}
