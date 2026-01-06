return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",     -- git status
    "nvim-tree/nvim-web-devicons", -- file icons
  },
  init = function()
    -- Disable auto setup; we’ll call setup manually
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    -- Add your barbar options here if you like
    -- animation = true,
    -- insert_at_start = true,
  },
  config = function(_, opts)
    -- Call setup explicitly (required when auto_setup = false)
    require("barbar").setup(opts)

    local map = vim.api.nvim_set_keymap
    local mopts = { noremap = true, silent = true }

    -- =========================
    -- Buffer navigation
    -- =========================
    map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", mopts)
    map("n", "<A-.>", "<Cmd>BufferNext<CR>", mopts)

    -- Re-order buffers
    map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", mopts)
    map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", mopts)

    -- Go to buffer by number (Alt + 1..9, 0 = last)
    for i = 1, 9 do
      map("n", "<A-" .. i .. ">", "<Cmd>BufferGoto " .. i .. "<CR>", mopts)
    end
    map("n", "<A-0>", "<Cmd>BufferLast<CR>", mopts)

    -- Pin/unpin buffer
    map("n", "<A-p>", "<Cmd>BufferPin<CR>", mopts)

    -- Close buffer
    map("n", "<A-c>", "<Cmd>BufferClose<CR>", mopts)

    -- Magic buffer picking
    map("n", "<C-p>", "<Cmd>BufferPick<CR>", mopts)
    map("n", "<C-S-p>", "<Cmd>BufferPickDelete<CR>", mopts)

    -- Optional: quick sort commands
    map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", mopts)
    map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", mopts)
  end,
}
