local ls = require("luasnip")

local c = ls.choice_node
local s = ls.snippet
local sn = ls.snippet_node
local d = ls.dynamic_node
local t = ls.text_node
local i = ls.insert_node
local ai = require("luasnip.nodes.absolute_indexer")
local rep = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta

local rec_ls
rec_ls = function()
  return sn(
    nil,
    c(1, {
      -- Order is important, sn(...) first would cause infinite loop of expansion.
      t(""),
      sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
    })
  )
end

ls.add_snippets("tex", {
  s(
    "beg",
    fmta("\\begin{<env>}\n  <a>\n\\end{<env>}\n<b>", { env = i(1), a = i(2), b = i(0) }, { repeat_duplicates = true })
  ),

  s("frm", {
    t({ "\\begin{frame}", "\t\\frametitle{" }),
    i(1),
    t({ "}", "\t" }),
    i(0),
    t({ "", "\\end{frame}" }),
  }),

  s("eqn", {
    t({ "\\begin{equation}\\label{eq:" }),
    i(2),
    t({ "}", "\t" }),
    i(1),
    t({ "", "\\end{equation}" }),
    i(0),
  }),

  s("ali", fmta("\\begin{align*}\n  <>\n\\end{align*}\n<>", { i(1), i(0) })),

  -- rec_ls is self-referencing. That makes this snippet 'infinite' eg. have as many
  -- \item as necessary by utilizing a choiceNode.
  s("item", {
    t({ "\\begin{itemize}", "\t\\item " }),
    i(1),
    d(2, rec_ls, {}),
    t({ "", "\\end{itemize}" }),
  }),

  s("enum", {
    t({ "\\begin{enumerate}", "\t\\item " }),
    i(1),
    d(2, rec_ls, {}),
    t({ "", "\\end{enumerate}" }),
  }),

  s("((", fmta("\\prn*{<>}<>", { i(1), i(0) })),
  s("{{", fmta("\\crl*{<>}<>", { i(1), i(0) })),
}, {
  key = "tex",
})

ls.add_snippets("tex", {
  s("dm", fmta("\\[\n  <>\n\\]\n<>", { i(1), i(0) })),
  s("mk", fmta("$<>$<>", { i(1), i(0) })),
  s("__", fmta("\\emph{<>}<>", { i(1), i(0) })),
  s("**", fmta("\\textbf{<>}<>", { i(1), i(0) })),
  s("defn", fmta("\\defn{<>}<>", { i(1), i(0) })),
}, {
  type = "autosnippets",
  key = "tex_auto",
})
