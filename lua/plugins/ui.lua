return {
  {
    "echasnovski/mini.statusline",
    enabled = true,
    event = "VeryLazy",
    config = function()
      local statusline = require("mini.statusline")
      statusline.setup({ use_icons = true })

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return "%2l:%-2v"
      end
    end,
  },
  { "moreka/alacritty.nvim", dev = true, event = "Colorscheme", opts = {} },
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    opts = {
      variant = "default", -- "deuteranopia",
      styles = { keywords = { italic = false } },
      on_highlights = function(h, c)
        h.DiagnosticVirtualTextInfo = { fg = c.blue_warmer, italic = true }
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
  { "tjdevries/colorbuddy.nvim" },
  { "lunacookies/vim-colors-xcode", priority = 1000 },
  { "moreka/gruber-darker", priority = 1000, dev = true },
}
