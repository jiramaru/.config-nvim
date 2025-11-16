return {
  "m4xshen/autoclose.nvim",
  config = function()
    require("autoclose").setup({
      keys = {
        ["$"] = { escape = true, close = false, pair = "$$", disabled_filetypes = {} },
        ["<"] = { escape = true, close = true, pair = "<>", disabled_filetypes = {} },
      },
      filetypes = {
        html = true,
        jsx = true,
        tsx = true, -- You might also want to add support for TSX
        -- Add any other custom components or filetypes you want to auto-close
        -- You can add other types like 'xml', 'vue', 'php', etc.
      },
    })
  end,
}
