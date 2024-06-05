vim.opt_local.textwidth = 100
-- vim.opt_local.conceallevel = 2
-- vim.opt_local.spell = true
-- vim.opt_local.foldenable = true
-- vim.opt_local.foldmethod = "expr"
-- vim.opt_local.foldexpr = "getline(v:lnum)=~'^\\s*%'"

vim.opt_local.formatoptions = vim.opt_local.formatoptions
  + "t" -- auto-wrap text
  - "r" -- do not insert comment after enter
  - "o" -- do not insert comment after o or O
  + "l" -- do not break long lines

vim.cmd([[
  let g:custom_toc1 = vimtex#toc#new({
      \ 'layers' : ['label', 'todo'],
      \ 'todo_sorted' : 0,
      \ 'show_help' : 0,
      \ 'show_numbers' : 0,
      \ 'mode' : 4,
      \})
  nnoremap <silent> <localleader>lY :call g:custom_toc1.open()<cr>

  let g:custom_toc2 = vimtex#toc#new({
      \ 'layers' : ['content'],
      \ 'show_help' : 0,
      \ 'split_pos' : 'vert rightbelow',
      \})
  nnoremap <silent> <localleader>ly :call g:custom_toc2.open()<cr>
]])

vim.b.surround_101 = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}" -- e
vim.b.surround_99 = "\\\1command: \1{\r}" -- c

-- surround with textbf
vim.keymap.set("v", "<C-b>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("Sctextbf<CR>", true, false, true), "t", false)
end)

-- surround with emph
vim.keymap.set("v", "<C-i>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("Scemph<CR>", true, false, true), "t", false)
end)

-- inkscape figures

vim.cmd([[
  inoremap <F1> <Esc>: silent exec '.!~/git/inkscape-figures/venv/bin/inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
  nnoremap <F1> : silent exec '!~/git/inkscape-figures/venv/bin/inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
]])

-- jumping to tags; making it work for labels that have hyphen in them
vim.opt_local.iskeyword:append("45")

-- as I will be having wrapping for equations, makes sense to add this here
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Ensure statusline is refreshed
vim.api.nvim_create_autocmd("User", {
  pattern = {
    "VimtexEventCompileStarted",
    "VimtexEventCompileStopped",
    "VimtexEventCompileSuccess",
    "VimtexEventCompileFailed",
    "VimtexEventCompiling",
  },
  desc = "Refresh statusline",
  group = vim.api.nvim_create_augroup("init_vimtex", { clear = true }),
  callback = function()
    vim.cmd("redrawstatus")
  end,
})

-- manual compilation
vim.keymap.set("n", "<localleader>l;", "<cmd>VimtexCompileSS<cr>", {})
