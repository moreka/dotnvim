return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "micangl/cmp-vimtex",
    },
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      return {
        completion = {
          completeopt = "menu,menuone,noselect",
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-y>"] = cmp.mapping(
            cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Insert,
              select = true,
            }),
            { "i", "c" }
          ),
          ["<C-space>"] = cmp.mapping({
            i = cmp.mapping.complete({}),
            c = function(_)
              if cmp.visible() then
                if not cmp.confirm({ select = true }) then
                  return
                end
              else
                cmp.complete()
              end
            end,
          }),
          ["<C-e>"] = cmp.mapping.abort(), -- TODO: vs close()
          ["<tab>"] = cmp.config.disable,
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "path" },
        }, {
          { name = "buffer", keyword_length = 3 },
        }),
        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              nvim_lsp = "[LSP]",
              luasnip = "[snip]",
              buffer = "[buf]",
              vimtex = vim_item.menu,
            })[entry.source.name]
            if not vim_item.menu then
              vim_item.menu = string.format("[%s]", entry.source.name)
            end
            return vim_item
          end,
          -- format = function(_, item)
          --   local icons = require("lazyvim.config").icons.kinds
          --   if icons[item.kind] then
          --     item.kind = icons[item.kind] .. item.kind
          --   end
          --   return item
          -- end,
        },
        experimental = {
          ghost_text = false,
          -- {
          --   hl_group = "CmpGhostText",
          -- },
        },
        sorting = defaults.sorting,
      }
    end,
    config = function(_, opts)
      for _, source in ipairs(opts.sources) do
        source.group_index = source.group_index or 1
      end
      local cmp = require("cmp")
      cmp.setup(opts)
      cmp.setup.filetype("tex", {
        sources = {
          { name = "luasnip" },
          { name = "vimtex" },
          { name = "path", option = { trailing_slash = true } },
          { name = "buffer", keyword_length = 3 },
        },
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    dependencies = {
      {
        "nvim-cmp",
        dependencies = {
          "saadparwaiz1/cmp_luasnip",
        },
        opts = function(_, opts)
          opts.snippet = {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end,
          }
          table.insert(opts.sources, { name = "luasnip" })
        end,
      },
    },
    opts = function()
      local ls = require("luasnip")
      vim.keymap.set({ "i", "s" }, "<c-j>", function()
        if ls.expand_or_jumpable() then
          ls.expand_or_jump()
        end
      end, { silent = true })

      require("snippets")

      return {
        history = true,
        delete_check_events = "TextChanged",
        enable_autosnippets = true,
      }
    end,
  },
}
