local dark_theme = "gruvbox"
local light_theme = "modus_operandi"

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
      vim.cmd.colorscheme(light_theme)
    else
      vim.cmd.colorscheme(dark_theme)
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
