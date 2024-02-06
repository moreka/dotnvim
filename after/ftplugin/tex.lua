vim.opt_local.textwidth = 110
vim.opt_local.foldenable = true
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "getline(v:lnum)=~'^\\s*%'"

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
