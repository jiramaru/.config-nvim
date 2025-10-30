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

    -- Register the sources
    local sources = {
      null_ls.builtins.formatting.stylua, -- Lua formatter
      null_ls.builtins.formatting.black,  -- Python formatter
      null_ls.builtins.formatting.isort,  -- Python import sorter

      -- ✅ Prettier for React, React Native, Next.js, etc.
      null_ls.builtins.formatting.prettier.with({
        filetypes = {
          "javascript", "javascriptreact",
          "typescript", "typescriptreact",
          "json", "css", "scss", "html",
          "markdown", "yaml",
        },
      }),
    }

    -- Setup null-ls
    null_ls.setup({
      sources = sources,

      -- Optional: Format on save
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })

    -- Optional manual keymap (just in case you want to trigger it manually)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format file with null-ls/Prettier" })
  end,
}

