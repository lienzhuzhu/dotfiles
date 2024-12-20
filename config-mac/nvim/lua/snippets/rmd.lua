-- snippets/rmd.lua
-- Author: Lien Zhu
-- Description: Useful snippets for R Markdown editing.


local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("markdown", {
    s("---", {
        t({ "---", "title: " }),
        i(1, "Your Title Here"),
        t({ "",
            "date: \"`r Sys.Date()`\"",
            "output: pdf_document",     --TODO: make this a toggle node.
            "---",
            "",
            ""
        }),
        i(0), -- Cursor moves here after snippet expansion
    }),
})
