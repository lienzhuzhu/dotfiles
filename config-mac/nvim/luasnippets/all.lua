-- luasnippets/all.lua
-- Description: Snippets for all file types.


return {
    s({
            trig=";lz",
            dscr="Autotriggered snippet for name in English",
            regTrig=false,
            priority=1000,
            snippetType="autosnippet"
        },
        {
            t("Lien Zhu"),
    }),
    s({
            trig = ";zl",
            dscr = "International name choice node snippet",
        },
        {
            c(1, {
                t("ZHU, LIEN"),
                t("朱利恩"),
            }),
            i(0),
    }),
}
