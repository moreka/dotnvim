local dark_theme = "gruber-darker"
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

custom_colors("modus_operandi", function()
  local bg = require("alacritty").get_color_from_hl_group("Normal", "bg")
  require("alacritty").alacritty_msg_set_bg(bg)
  vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    callback = function()
      require("alacritty").alacritty_msg_set_bg("#181818")
    end,
  })
end)

custom_colors("minischeme", function()
  hl(0, "Normal", { bg = "#e2e5ca", fg = "#000000" })
end)

custom_colors("gruvbox-material", function()
  vim.cmd([[
    function! s:custom_gruvvy() abort
      let l:palette = gruvbox_material#get_palette('hard', 'mix', {})
      call gruvbox_material#highlight('texMathCmd', l:palette.aqua, l:palette.none)
    endfunction
    call s:custom_gruvvy()
  ]])
end)

custom_colors("nord", function()
  hl(0, "Visual", { fg = "#2E3440", bg = "#88C0D0" })
  hl(0, "VisualNOS", { fg = "#2E3440", bg = "#88C0D0" })
  hl(0, "Delimiter", { fg = "#D8DEE9" })
end)

custom_colors("xcodelight", function()
  vim.cmd([[
    hi texCmd guifg=#ad3da4 guibg=NONE gui=NONE ctermfg=127 ctermbg=NONE cterm=NONE
    hi! link texMathEnvArgName texEnvArgName
    hi! link texMathZone LocalIdent
    hi! link texMathZoneEnv texMathZone
    hi! link texMathZoneEnvStarred texMathZone
    hi! link texMathZoneX texMathZone
    hi! link texMathZoneXX texMathZone
    hi! link texMathZoneEnsured texMathZone

    " Small tweaks
    hi! link QuickFixLine Normal
    hi! link qfLineNr Normal
    hi! link EndOfBuffer LineNr
    hi! link Conceal LocalIdent
]])
end)

-- local choptgrp = vim.api.nvim_create_augroup("change_opt_group", { clear = true })
-- vim.api.nvim_create_autocmd("OptionSet", {
--   group = choptgrp,
--   nested = false,
--   pattern = "background",
--   callback = function()
--     vim.print("background changed opt: " .. vim.opt.background:get())
--     vim.print("background changed o: " .. vim.o.background)
--     vim.cmd.hi("clear")
--     if vim.opt.background:get() == "dark" then
--       vim.cmd.colorscheme(light_theme)
--     else
--       vim.cmd.colorscheme(dark_theme)
--     end
--   end,
-- })

if os.getenv("BACKGROUND") == "light" then
  vim.o.background = "light"
  vim.cmd.colorscheme(light_theme)
else
  vim.o.background = "dark"
  vim.cmd.colorscheme(dark_theme)
end
