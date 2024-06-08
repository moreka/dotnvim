return {
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    cmd = "ConformInfo",
    -- event = { "BufWritePre" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = { "n", "v" },
      },
    },
    opts = {
      format = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        python = { "black", "isort" },
        tex = { "latexindent" },
      },
      formatters = {
        latexindent = {
          args = { "-m", "-l", "-" },
        },
      },
      -- format_on_save = function(bufnr)
      --   if vim.bo[bufnr].filetype == "tex" then
      --     return {
      --       timeout_ms = 500,
      --       lsp_fallback = false,
      --     }
      --   end
      -- end,
    },
  },
}
