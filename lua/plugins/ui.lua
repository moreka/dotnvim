return {
  { "nyoom-engineering/oxocarbon.nvim", priority = 1000 },
  {
    "sainnhe/sonokai",
    priority = 1000,
    init = function()
      vim.g.sonokai_better_performance = 1
      vim.g.sonokai_style = "maia"
    end,
  },
}
