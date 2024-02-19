local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- go to last loc when opening a buffer
autocmd("BufReadPost", {
  group = augroup("my_last_loc", { clear = true }),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].my_last_loc then
      return
    end
    vim.b[buf].my_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

autocmd({ "FileType" }, {
  group = augroup("markdown_conceal", {}),
  pattern = { "markdown", "rmd" },
  callback = function()
    vim.opt_local.conceallevel = 1
  end,
})

autocmd({ "FileType" }, {
  group = augroup("mail_textlength", {}),
  pattern = { "mail" },
  callback = function()
    vim.opt_local.textwidth = 79
  end,
})

autocmd({ "FileType" }, {
  group = augroup("fugitive_keys", {}),
  pattern = { "fugitive" },
  callback = function(args)
    local opts = { buffer = args.buf, remap = false }
    vim.keymap.set("n", "<leader>p", function()
      vim.cmd.Git("push")
    end, opts)

    vim.keymap.set("n", "<leader>P", function()
      vim.cmd.Git("pull")
    end, opts)

    vim.keymap.set("n", "q", function()
      vim.api.nvim_win_close(vim.api.nvim_get_current_win(), false)
    end, opts)
  end,
})

vim.api.nvim_create_autocmd("User", {
  group = vim.api.nvim_create_augroup("init_vimtex", {}),
  pattern = "VimtexEventViewReverse",
  desc = "VimTeX: Center view on inverse search",
  command = [[ normal! zMzvzz ]],
})

-- vim: foldmethod=marker
