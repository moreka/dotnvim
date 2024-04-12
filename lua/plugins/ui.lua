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
  { "moreka/alacritty.nvim", dev = false, event = "Colorscheme", opts = {} },
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 1,
        options = {
          signcolumn = "no", -- disable signcolumn
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
          cursorline = false, -- disable cursorline
          cursorcolumn = false, -- disable cursor column
          foldcolumn = "0", -- disable fold column
          list = false, -- disable whitespace characters
        },
      },
      plugins = {
        alacritty = { enabled = true, font = 16 },
        twilight = { enabled = false },
        gitsigns = { enabled = false },
      },
    },
    cmd = { "ZenMode" },
  },

  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    opts = {
      styles = { italic = false },
      highlight_groups = {
        Cursor = { bg = "love" },
      }
    },
  },
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    init = function()
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_better_performance = 1
    end,
  },
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    opts = {
      variant = "default", -- "deuteranopia",
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
  { "echasnovski/mini.hues", version = false },
  { "tjdevries/colorbuddy.nvim" },
}
