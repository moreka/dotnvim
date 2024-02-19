vim.opt_local.textwidth = 110
vim.opt_local.foldenable = true
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "getline(v:lnum)=~'^\\s*%'"
vim.opt_local.spell = true

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

-- remove trailing whitespace

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = vim.api.nvim_create_augroup("RemoveWhitespace", {}),
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
