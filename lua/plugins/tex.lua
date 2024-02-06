return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_compiler_silent = 0
      vim.g.vimtex_complete_bib = {
        simple = 0, -- change to 1 if using auto-complete
        menu_fmt = "@year, @author_short, @title",
      }
      vim.g.vimtex_doc_handlers = { "vimtex#doc#handlers#texdoc" }
      vim.g.vimtex_format_enabled = 1
      vim.g.vimtex_quickfix_method = "pplatex"
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_syntax_enabled = 1
      vim.g.vimtex_syntax_conceal_disable = 1
      vim.g.vimtex_include_search_enabled = 1
      vim.g.vimtex_view_automatic = 0
      vim.g.vimtex_view_forward_search_on_start = 0
      if vim.uv.os_uname().sysname == "Linux" then
        vim.g.vimtex_view_method = "zathura"
      else
        vim.g.vimtex_view_method = "skim"
      end
      vim.g.vimtex_indent_on_ampersands = 0
      vim.g.vimtex_quickfix_ignore_filters = {
        "Generic hook",
        "LaTeX Font Warning:",
        "Package hyperref Warning: Token not allowed in a PDF string",
        -- "Underfull",
        -- "Overfull",
      }
      vim.g.vimtex_syntax_custom_cmds = {
        { name = "para", argstyle = "bold", opt = false },
      }
    end,
  },
}
