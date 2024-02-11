local map = vim.keymap.set

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

map("n", "<M-CR>", "<cmd>let v:hlsearch=!v:hlsearch<cr>", { silent = true })

map("x", "<leader>p", '"_dP') -- delete into blackhole register and paste
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y') -- yank whole line into clipboard

-- move line up/down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- netrw
map("n", "<leader>pv", "<cmd>Ex<cr>")

map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[q", vim.cmd.cprevious, { desc = "previous quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "next quickfix" })
map("n", "[t", vim.cmd.tabprevious, { desc = "previous tab" })
map("n", "]t", vim.cmd.tabnext, { desc = "next tab" })

-- other stuff
map("n", "Q", "<nop>")
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
map({ "n", "v", "i" }, "<f1>", "<Nop>", { silent = true })

map("t", "<Esc><Esc>", "<C-\\><C-n>")
map("t", "<A-h>", "<C-\\><C-n><C-w>h")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
