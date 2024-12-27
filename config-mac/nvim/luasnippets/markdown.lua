local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
	s("hw", t("hello world of luasnip")),
    s(
    { -- Table 1: snippet parameters
      trig="sayhi",
      dscr="An autotriggering snippet that expands 'hi' into 'Hello, world!'",
      regTrig=false,
      priority=1000,
      snippetType="autosnippet"
    },
    {
      t("Hello, world!"), -- A single text node
    }
  )
}
