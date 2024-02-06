return {
  { "nyoom-engineering/oxocarbon.nvim", priority = 1000 },
  { "HoNamDuong/hybrid.nvim", opts = {}, priority = 1000 },
  { "echasnovski/mini.base16", version = false, priority = 1000 },
  {
    "moreka/adwaita.nvim",
    dev = true,
    priority = 1000,
    config = function()
      vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:Cursor/lCursor"
    end,
  },
}
