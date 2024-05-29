return {
  {
    "echasnovski/mini.statusline",
    enabled = true,
    event = "LazyFile",
    config = function()
      local get_vimtex_info = function()
        local status = vim.b.vimtex.compiler.status + 2
        local status_table = { "[ off]", "[ off]", "[ compiling]", "[ success]", "[ error]" }
        return status_table[status]
      end
      local active = function()
        local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
        local git = MiniStatusline.section_git({ trunc_width = 40 })
        local diff = MiniStatusline.section_diff({ trunc_width = 75 })
        local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
        local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
        local filename = MiniStatusline.section_filename({ trunc_width = 140 })
        local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
        local location = MiniStatusline.section_location({ trunc_width = 75 })
        local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
        local vimtex = vim.b.vimtex and get_vimtex_info() or ""

        return MiniStatusline.combine_groups({
          { hl = mode_hl, strings = { mode } },
          { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics, lsp, vimtex } },
          "%<", -- Mark general truncate point
          { hl = "MiniStatuslineFilename", strings = { filename } },
          "%=", -- End left alignment
          { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
          { hl = mode_hl, strings = { search, location } },
        })
      end

      local statusline = require("mini.statusline")
      statusline.setup({ use_icons = true, set_vim_settings = false, content = { active = active } })

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
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        backdrop = 1,
        options = {
          signcolumn = "no",
          number = false,
          relativenumber = false,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        alacritty = {
          enabled = true,
          font = 16,
        },
      },
    },
  },
  { dir = "~/git/tango-dark.nvim", priority = 1000 },
  { "nyoom-engineering/oxocarbon.nvim", priority = 1000 },
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    opts = {
      variant = "tritanopia", -- "deuteranopia",
      styles = { keywords = { italic = false } },
      on_colors = function(colors)
        -- colors.tinted_bg_main = "#f5eee6"
        -- colors.bg_main = "#f5eee6"
        -- colors.fg_main = "#424242"
        colors.visual = "#bdbdbd"
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

        h.MiniStatuslineDevinfo = { fg = c.blue_faint, bg = c.bg_status_line_active }
        h.MiniStatuslineFileinfo = { fg = c.fg_status_line_active, bg = c.bg_status_line_active }
        h.MiniStatuslineFilename = { fg = c.fg_status_line_active, bg = c.bg_status_line_active, bold = true }
        h.MiniStatuslineInactive = { fg = c.fg_status_line_inactive, bg = c.bg_status_line_inactive, bold = true }
        h.MiniStatuslineModeCommand = { fg = c.fg_status_line_active, bg = c.bg_status_line_active }
        h.MiniStatuslineModeInsert = { fg = c.fg_status_line_active, bg = c.bg_status_line_active }
        h.MiniStatuslineModeNormal = { fg = c.fg_status_line_active, bg = c.bg_status_line_active }
        h.MiniStatuslineModeOther = { fg = c.fg_status_line_active, bg = c.bg_status_line_active }
        h.MiniStatuslineModeReplace = { fg = c.fg_status_line_active, bg = c.bg_status_line_active }
        h.MiniStatuslineModeVisual = { fg = c.fg_status_line_active, bg = c.bg_status_line_active }
      end,
    },
  },
  { "tjdevries/colorbuddy.nvim" },
  { "lunacookies/vim-colors-xcode", priority = 1000 },
  { "moreka/gruber-darker", priority = 1000, dev = true },
}
