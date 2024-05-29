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

local tele_git_cache = {}

local function project_files()
  local opts = { theme = "ivy" }

  local cwd = vim.fn.getcwd()
  if tele_git_cache[cwd] == nil then
    vim.fn.system("git rev-parse --is-inside-work-tree")
    tele_git_cache[cwd] = vim.v.shell_error == 0
  end

  if tele_git_cache[cwd] then
    require("telescope.builtin").git_files(opts)
  else
    require("telescope.builtin").find_files(opts)
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
      { "<C-p>", project_files },
      { "<C-t>", "<cmd>Telescope resume<cr>", desc = "Resume" },
      { "z=", "<cmd>Telescope spell_suggest<cr>", desc = "Spelling suggestions" },
    },
    opts = function()
      return {
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
      }
    end,
  },
}
