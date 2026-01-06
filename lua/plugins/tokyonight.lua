return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      transparent = true, -- enables transparency built into the theme
    })
    vim.cmd("colorscheme tokyonight")
    vim.api.nvim_set_hl(0, "GitSignsAdd",    { fg = "#9ece6a" })
    vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#7aa2f7" })
    vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#f7768e" })
  end,
}

