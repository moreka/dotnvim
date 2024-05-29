vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.g.tex_flavor = "latex"
vim.g.tex_comment_nospell = 1

local opt = vim.opt

opt.backup = false
opt.breakindent = true
opt.completeopt = "menu,menuone,noselect"
opt.confirm = true
opt.cursorline = true
opt.cursorlineopt = "number"
opt.expandtab = true
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = "~",
}
-- opt.formatoptions = "jcroqlnt" -- tcqj
opt.formatoptions = opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.guicursor =
  "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait500-blinkon500-blinkoff500-Cursor/lCursor"
opt.hlsearch = true
opt.ignorecase = true
opt.inccommand = "split" -- preview incremental substitute
opt.incsearch = true
opt.laststatus = 2
opt.list = true -- Show some invisible characters (tabs...
opt.listchars = "tab:» ,trail:-"
opt.linebreak = true
opt.mouse = "a"
opt.number = true
opt.pumblend = 10
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true
opt.scrolloff = 4
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent to multiple of shiftwidth
opt.shiftwidth = 2
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showbreak = "󱞩 "
opt.showmode = false
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "no"
opt.smartcase = true
opt.smartindent = true
opt.smoothscroll = true
opt.spelllang = { "en" }
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2
opt.tags = { "tags;~", ".tags;~" }
opt.termguicolors = true
opt.timeoutlen = 300
opt.undofile = true
opt.undodir = { vim.fn.stdpath("data") .. "/undodir" }
opt.undolevels = 10000
opt.updatetime = 250
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full"
opt.winminwidth = 5
opt.wrap = true

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
