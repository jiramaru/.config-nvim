return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
    vim.keymap.set("n", "<leader>n", ":Neotree close <CR>", {})

    -- Set NeoTree transparency (winblend)
    require("neo-tree").setup({
      window = {
        width = 30,    -- Set the width of the NeoTree window
        winblend = 10, -- This controls transparency level (higher value = more transparent)
        mappings = {
          -- Define key mappings if needed
        },
      },
    })
  end,
}
