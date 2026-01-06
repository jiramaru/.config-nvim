return {
  "numToStr/FTerm.nvim",
  config = function()
    local FTerm = require("FTerm")

    local term = FTerm:new({
      border = "rounded",
      dimensions = {
        height = 0.8,
        width = 0.8,
      },
      winblend = 10,
    })

    vim.keymap.set("n", "<leader>t", function()
      term:toggle()
    end, { noremap = true, silent = true })
  end,
}
