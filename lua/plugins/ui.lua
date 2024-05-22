return {
  {
    "echasnovski/mini.statusline",
    enabled = true,
    event = "VeryLazy",
    config = function()
      local statusline = require("mini.statusline")
      statusline.setup({ use_icons = true, set_vim_settings = false })

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return "%2l:%-2v"
      end
    end,
  },
  {
    "moreka/alacritty.nvim",
    enabled = true,
    dev = true,
    event = "Colorscheme",
    opts = {},
  },
  {
    "junegunn/limelight.vim",
    cmd = "Limelight",
    keys = {
      { "<leader>lf", "<cmd>Limelight!!<cr>" },
    },
  },
  { dir = "~/git/tango-dark.nvim", priority = 1000 },
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    opts = {
      variant = "tinted", -- "deuteranopia",
      styles = { keywords = { italic = false } },
      on_colors = function(colors)
        colors.tinted_bg_main = "#f5eee6"
        colors.bg_main = "#f5eee6"
        colors.fg_main = "#424242"
      end,
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
