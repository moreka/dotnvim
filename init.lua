if vim.g.neovide then
  vim.o.guifont = "Hack:h10"
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
  vim.g.neovide_cursor_animation_length = 0.13
  vim.g.neovide_cursor_trail_size = 0
  vim.g.neovide_cursor_animate_command_line = false

  vim.keymap.set({ "n", "v", "x" }, "<M-S-k>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>")
  vim.keymap.set({ "n", "v", "x" }, "<M-S-j>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>")

  vim.keymap.set({ "n", "v", "i" }, "<M-v>", '<cmd>norm "+P<cr>')

  if vim.uv.os_uname().sysname == "Linux" then
  else
    vim.g.neovide_floating_blur_amount_x = 2.0
    vim.g.neovide_floating_blur_amount_y = 2.0
    vim.g.neovide_input_macos_alt_is_meta = true
  end
end

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

require("color")
