return {
  { "echasnovski/mini.statusline", enabled = false, event = "VeryLazy", opts = {} },
  { "moreka/alacritty.nvim", dev = true, event = "Colorscheme", opts = {} },
  { "folke/zen-mode.nvim", opts = { plugins = { alacritty = { enabled = true } } }, cmd = { "ZenMode" } },

  { "moreka/gruber-darker.nvim", priority = 1000 },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = function()
      local palette = require("gruvbox").palette
      return {
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = false,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {
          texDelim = { fg = palette.bright_yellow },
          texMathDelimZone = { fg = palette.bright_yellow },
          texMathCmd = { fg = palette.bright_aqua },
          texEnvArgName = { fg = palette.bright_aqua, bold = true },
        },
        dim_inactive = false,
        transparent_mode = false,
      }
    end,
  },
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
