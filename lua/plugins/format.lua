return {
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    cmd = "ConformInfo",
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
          args = { "-l", "-" },
        },
      },
    },
  },
}
