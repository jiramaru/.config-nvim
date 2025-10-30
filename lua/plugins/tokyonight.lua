return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      transparent = true, -- enables transparency built into the theme
    })
    vim.cmd("colorscheme tokyonight")
  end,
}

