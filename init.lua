vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("lazy-setup")

local lazy_autocmds = vim.fn.argc(-1) == 0
if not lazy_autocmds then
  require("autocmds")
end

local lazysetupgrp = vim.api.nvim_create_augroup("LazySetup", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = lazysetupgrp,
  pattern = "VeryLazy",
  callback = function()
    if lazy_autocmds then
      require("autocmds")
    end
    require("keymaps")
  end,
})

--{{{ Colorscheme stuff

local dark_theme = "minicyan"
local light_theme = "minischeme"

local hl = vim.api.nvim_set_hl
local csgrp = vim.api.nvim_create_augroup("colorscheme_group", { clear = true })

-- creates an autocmd that runs `cb` when setting the colorscheme to `scheme`.
local custom_colors = function(scheme, cb)
  vim.api.nvim_create_autocmd("Colorscheme", {
    group = csgrp,
    pattern = scheme,
    callback = cb,
  })
end

custom_colors("minischeme", function()
  hl(0, "Normal", { bg = "#e2e5ca", fg = "#000000" })
end)

local choptgrp = vim.api.nvim_create_augroup("change_opt_group", { clear = true })
vim.api.nvim_create_autocmd("OptionSet", {
  group = choptgrp,
  nested = true,
  pattern = "background",
  callback = function()
    vim.cmd.hi("clear")
    if vim.o.background == "light" then
      vim.cmd.colorscheme(vim.g.light_theme)
    else
      vim.cmd.colorscheme(vim.g.dark_theme)
    end
  end,
})

if os.getenv("BACKGROUND") == "light" then
  vim.o.background = "light"
  vim.cmd.colorscheme(light_theme)
else
  vim.o.background = "dark"
  vim.cmd.colorscheme(dark_theme)
end

--}}}
