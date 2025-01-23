-- luasnippets/markdown.lua
-- Description: Snippets exclusive for Markdown and R Markdown files.


local function filename_no_ext()
    return vim.fn.expand("%:t:r"):gsub("_", " ")
end


return {
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
    }),
    s("nt", {
        t("# "), f(filename_no_ext, {}), t({"", "", ""}),
        t("Date: "), i(1, os.date("%Y-%m-%d")), t({"", "", ""}),
        t("Instructor: "), i(2), t({"", "", ""}),
        t("## "), i(3), t({"", "", ""}),
        i(0),
    })
}
