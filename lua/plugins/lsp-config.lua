return {
  -- Mason package manager
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- Mason-LSPConfig
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pylsp", "ts_ls", "cssmodules_ls", "eslint" },
      })
    end,
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      local on_attach = function(client, bufnr)
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      end

      -- Lua
      if lspconfig.lua_ls then
        lspconfig.lua_ls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            Lua = { diagnostics = { globals = { "vim" } } }
          }
        })
      end

      -- Python
      if lspconfig.pylsp then
        lspconfig.pylsp.setup({ on_attach = on_attach, capabilities = capabilities })
      end

      -- TypeScript / JavaScript
      if lspconfig.ts_ls then
        lspconfig.ts_ls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "json" },
          root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "next.config.js"),
        })
      end

      -- CSS Modules
      if lspconfig.cssmodules_ls then
        lspconfig.cssmodules_ls.setup({ on_attach = on_attach, capabilities = capabilities })
      end

      -- ESLint
      if lspconfig.eslint then
        lspconfig.eslint.setup({ on_attach = on_attach, capabilities = capabilities })
      end
    end,
  },
}
