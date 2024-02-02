local diag_icons = {
  Error = " ",
  Warn  = " ",
  Hint  = " ",
  Info  = " ",
}

return {
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      { "folke/neodev.nvim", opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      -- options for vim.diagnostic.config()
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "icons",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = diag_icons.Error,
            [vim.diagnostic.severity.WARN] = diag_icons.Warn,
            [vim.diagnostic.severity.HINT] = diag_icons.Hint,
            [vim.diagnostic.severity.INFO] = diag_icons.Info,
          },
        },
      },
      -- add any global capabilities here
      capabilities = {},
      -- options for vim.lsp.buf.format
      -- `bufnr` and `filter` is handled by the LazyVim formatter,
      -- but can be also overridden when specified
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
      -- LSP Server Settings
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      },
      setup = {},
    },
    config = function(_, opts)
      -- setup keymaps
      local lspgroup = vim.api.nvim_create_augroup("UserLspAugrp", {})
      vim.api.nvim_create_autocmd("LspAttach", {
        group = lspgroup,
        callback = function(args)
          local buffer = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local key_opts = { buffer = buffer }

          -- TODO: change to telescope

          vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, key_opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, key_opts)
          vim.keymap.set({ "n", "i" }, "<C-s>", vim.lsp.buf.signature_help, key_opts)
          vim.keymap.set("n", "<space>cr", vim.lsp.buf.rename, key_opts)
          vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, key_opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, key_opts)
        end,
      })

      -- diagnostics
      for name, icon in pairs(diag_icons) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      if type(opts.diagnostics.virtual_text) == "table" and opts.diagnostics.virtual_text.prefix == "icons" then
        opts.diagnostics.virtual_text.prefix = function(diagnostic)
          local icons = diag_icons
          for d, icon in pairs(icons) do
            if diagnostic.severity == vim.diagnostic.severity[d:upper()] then
              return icon
            end
          end
        end
      end

      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      local servers = opts.servers
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        opts.capabilities or {}
      )

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      -- get all the servers that are available through mason-lspconfig
      local have_mason, mlsp = pcall(require, "mason-lspconfig")
      local all_mslp_servers = {}
      if have_mason then
        all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      if have_mason then
        mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
      end
    end,
  },

  -- cmdline tools and lsp servers
  {

    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "stylua",
        "luals",
        "pyright",
      },
    },
  },

}
