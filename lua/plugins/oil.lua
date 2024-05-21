return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    keys = {
      { "-", "<CMD>Oil<CR>", { desc = "Open parent directory" } },
      {
        "<leader>-",
        function()
          require("oil").toggle_float()
        end,
      },
    },
    cmd = "Oil",
    config = function()
      require("oil").setup({
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["<C-p>"] = false,
          ["<leader>p"] = "actions.preview",
          ["<M-h>"] = "actions.select_split",
        },
        view_options = {
          show_hidden = true,
        },
      })
    end,
  },
}
