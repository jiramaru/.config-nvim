return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
  priority = 1000,
  config = function()
    local null_ls = require("null-ls")

    -- Create format augroup
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    -- Register sources (formatters, linters, etc.)
    local sources = {
      -- Lua
      null_ls.builtins.formatting.stylua,

      -- Python
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.isort,

      -- JavaScript / TypeScript / React / Next.js / etc.
      null_ls.builtins.formatting.prettier.with({
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "json",
          "css",
          "scss",
          "html",
          "markdown",
          "yaml",
        },
      }),
    }

    -- Setup none-ls (null-ls)
    null_ls.setup({
      sources = sources,

      on_attach = function(client, bufnr)
        -- Autoformat on save
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              -- Use only null-ls for formatting if available
              vim.lsp.buf.format({
                bufnr = bufnr,
                async = false,
                filter = function(c)
                  return c.name == "null-ls"
                end,
              })
            end,
          })
        end
      end,
    })

    -- Manual formatting shortcut
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({
        async = true,
        filter = function(client)
          return client.name == "null-ls"
        end,
      })
    end, { desc = "Format file with null-ls/Prettier" })
  end,
}

