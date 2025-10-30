return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Setup web-devicons for file icons
    require("nvim-web-devicons").setup({
      default = true, -- fallback icons for unknown filetypes
    })

    -- Neo-tree setup
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        width = 35,
      },
      filesystem = {
        follow_current_file = true,
        hijack_netrw_behavior = "open_default",
        filtered_items = {
          visible = true,        -- show hidden files
          hide_dotfiles = false, -- don't hide dotfiles
          hide_gitignored = false,
        },
      },
      git_status = {
        window = {
          position = "right",
          width = 10,
        },
        symbols = {
          added = "✚",
          modified = "",
          deleted = "✖",
          renamed = "➜",
          untracked = "★",
          ignored = "◌",
          unstaged = "✗",
          staged = "✓",
          conflict = "",
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warn = "",
          error = "",
        },
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
    vim.keymap.set("n", "<leader>n", ":Neotree close<CR>", {})
  end,
}

