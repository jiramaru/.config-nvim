return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    signs = {
      add          = { text = "+" }, -- line added
      change       = { text = "~" }, -- line changed
      delete       = { text = "-" }, -- line deleted
      topdelete    = { text = "^" }, -- top line deleted
      changedelete = { text = "%" }, -- changed + deleted
      untracked    = { text = "?" }, -- untracked line
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, lhs, rhs, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, lhs, rhs, opts)
      end

      -- Navigation between hunks
      map("n", "]c", function()
        if vim.wo.diff then return "]c" end
        vim.schedule(function() gs.next_hunk() end)
        return "<Ignore>"
      end, { expr = true })

      map("n", "[c", function()
        if vim.wo.diff then return "[c" end
        vim.schedule(function() gs.prev_hunk() end)
        return "<Ignore>"
      end, { expr = true })
    end,
  },
}
