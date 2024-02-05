local function on_load(name, callback)
  local Config = require("lazy.core.config")
  if Config.plugins[name] and Config.plugins[name]._.loaded then
    callback(name)
  else
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyLoad",
      callback = function(event)
        if event.data == name then
          callback(name)
          return true
        end
      end,
    })
  end
end

return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          on_load("telescope.nvim", function()
            require("telescope").load_extension("fzf")
          end)
        end,
      },
    },
    keys = {
      { "<leader>,", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>" },
      { "<leader>ps", "<cmd>Telescope live_grep<cr>" },
      { "<leader>pf", "<cmd>Telescope find_files<cr>" },
      { "<C-p>", "<cmd>Telescope git_files<cr>" },
      { "<C-t>", "<cmd>Telescope resume<cr>", desc = "Resume" },
    },
    opts = {
      pickers = {
        find_files = { theme = "ivy" },
        buffers = { theme = "ivy" },
        live_grep = { theme = "ivy" },
        git_files = { theme = "ivy" },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    },
  },
}
