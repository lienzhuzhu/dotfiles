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
    }),
    s("!", {
        t({"> [!IMPORTANT]", "> "}),
        i(0)
    }),
    s("fm", {
        t({ "+++", "" }),
        t("title = \""), i(1, "Page Title"), t({"\"", ""}),
        t("description = \""), i(2, "Short description"), t({"\"", ""}),
        t("date = \""), i(3, os.date("%Y-%m-%d")), t({"\"", ""}),
        t("draft = "), c(4, { t("false"), t("true") }), t({ "", "" }),
        t({ "+++", "", "" }),
        i(0),
    })
}
