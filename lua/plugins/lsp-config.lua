return {
  -- ==========================
  -- Mason package manager setup
  -- ==========================
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

  -- ==========================
  -- Mason-LSPConfig setup
  -- Ensures LSP servers are installed
  -- ==========================
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",   -- Lua language server
          "pylsp",    -- Python LSP
          "ts_ls",    -- TypeScript/JavaScript LSP
          "eslint",   -- ESLint for JS/TS/React/Next.js
          "html",     -- HTML language server
          "cssls",    -- CSS language server
          "jsonls",   -- JSON language server
        },
      })
    end,
  },

  -- ==========================
  -- LSP configuration
  -- Uses the new `vim.lsp.config` API (Neovim 0.11+)
  -- Fallback to `require("lspconfig")` for older versions
  -- ==========================
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "hrsh7th/cmp-nvim-lsp" }, -- for completion capabilities
    config = function()
      -- --------------------------
      -- Setup LSP capabilities
      -- --------------------------
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      -- --------------------------
      -- Common on_attach function
      -- Runs for each LSP server when attached to a buffer
      -- --------------------------
      local on_attach = function(client, bufnr)
        -- Enable omnifunc for LSP-based completion
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Buffer-local keymaps for LSP functionality
        local opts = { buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)           -- Hover documentation
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)     -- Go to definition
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- Code actions
      end

      -- --------------------------
      -- List of servers to setup
      -- --------------------------
      local servers = { "lua_ls", "pylsp", "ts_ls", "eslint", "html", "cssls", "jsonls" }

      -- Check if the new API is available (Neovim 0.11+)
      local has_new_api = vim.lsp and vim.lsp.config

      -- --------------------------
      -- Setup each server
      -- Uses `vim.lsp.config` if available, else fallback
      -- --------------------------
      for _, server in ipairs(servers) do
        if has_new_api then
          vim.lsp.config[server].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        else
          require("lspconfig")[server].setup({
            on_attach = on_attach,
            capabilities = capabilities,
          })
        end
      end

      -- --------------------------
      -- Special configuration for TypeScript/JavaScript (React/Next.js)
      -- Ensures proper root detection and filetypes
      -- --------------------------
      if has_new_api then
        vim.lsp.config.ts_ls.setup({
          on_attach = on_attach,
          capabilities = capabilities,
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "json" },
          root_dir = vim.lsp.util.root_pattern("package.json", "tsconfig.json", "next.config.js"),
        })
      end
    end,
  },
}

