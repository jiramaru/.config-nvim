return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- Keymaps
    vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
    vim.keymap.set("n", "<leader>n", ":NvimTreeClose<CR>", { desc = "Close NvimTree" })

    -- Setup
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left", -- same side as your Neo-tree config
      },

      renderer = {
        group_empty = true,
      },

      filters = {
        dotfiles = false,
      },

      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
    })
  end,
}
