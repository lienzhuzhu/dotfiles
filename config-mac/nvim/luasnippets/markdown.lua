-- luasnippets/markdown.lua
-- Description: Snippets exclusive for Markdown and R Markdown files.


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
