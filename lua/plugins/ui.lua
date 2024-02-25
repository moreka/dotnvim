return {
  { "echasnovski/mini.statusline", enabled = false, event = "VeryLazy", opts = {} },
  { "moreka/alacritty.nvim", dev = true, event = "Colorscheme", opts = {} },

  { "moreka/gruber-darker.nvim", priority = 1000 },
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    opts = {
      variant = "tinted", -- "deuteranopia",
      styles = { keywords = { italic = false } },
      on_highlights = function(h, c)
        -- h.texCmd = { link = "Function" }
        h.texCmdPart = { fg = c.magenta, bold = true }
        h.texPartArgTitle = { fg = c.blue_warmer, bold = true }
        h.texCmdCRef = { link = "Identifier" }
        h.texCmdRef = { link = "texCmdCRef" }
        h.texRefArg = { link = "texCmdCRef" }
        -- h.texMathZone = { fg = c.green_faint }
        h.texMathDelimZone = { fg = c.green_warmer }
        -- h.texMathCmd = { link = "texMathZone" }
        h.texCmdEnv = { link = "Function" }
        h.texDelim = { link = "Normal" }
      end,
    },
  },
  { "echasnovski/mini.base16", version = false, priority = 1000 },
}
