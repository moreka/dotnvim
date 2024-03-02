local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

ls.add_snippets("tex", {
  s("frm", {
    t({ "\\begin{frame}", "\t\\frametitle{" }),
    i(1),
    t({ "}", "\t" }),
    i(0),
    t({ "", "\\end{frame}" }),
  }),

  s("beg", {
    t({ "\\begin{" }),
    i(1),
    t({ "}", "\t" }),
    i(0),
    t({ "", "\\end{" }),
    rep(1),
    t({ "}" }),
  }),

  s("eqn", {
    t({ "\\begin{equation}\\label{eq:" }),
    i(2),
    t({ "}", "\t" }),
    i(1),
    t({ "", "\\end{equation}" }),
    i(0),
  }),

  s("ali", {
    t({ "\\begin{align*}", "" }),
    t({ "\t" }),
    i(1),
    t({ "", "\\end{align*}", "" }),
    i(0),
  }),

  s("item", {
    t({ "\\begin{itemize}", "\t\\item " }),
    i(0),
    t({ "", "\\end{itemize}", "" }),
  }),

  s("enum", {
    t({ "\\begin{enumerate}", "\t\\item " }),
    i(0),
    t({ "", "\\end{enumerate}", "" }),
  }),

  s("((", { t({ "\\prn*{" }), i(1), t({ "}" }), i(0) }),
  s("{{", { t({ "\\crl*{" }), i(1), t({ "}" }), i(0) }),
}, {
  key = "tex",
})

ls.add_snippets("tex", {
  s("dm", {
    t({ "\\[", "\t" }),
    i(1),
    t({ "", "\\]", "" }),
    i(0),
  }),
  s("mk", {
    t({ "$" }),
    i(1),
    t({ "$" }),
    i(0),
  }),
  s("__", {
    t({ "\\emph{" }),
    i(1),
    t({ "}" }),
    i(0),
  }),
  s("**", {
    t({ "\\textbf{" }),
    i(1),
    t({ "}" }),
    i(0),
  }),
}, {
  type = "autosnippets",
  key = "tex_auto",
})
