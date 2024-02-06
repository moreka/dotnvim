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

if os.getenv("BACKGROUND") == "light" then
  vim.o.background = "light"
  vim.cmd.colorscheme("adwaita")
else
  vim.cmd.colorscheme("minicyan")
end
