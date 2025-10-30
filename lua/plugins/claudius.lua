-- ~/.config/nvim/lua/plugins/claudius.lua
return {
  {
    "gbrlsnchs/claudius.nvim",  -- AI assistant plugin
    event = "VeryLazy",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      -- Ensure your Hugging Face API key is set in your environment:
      -- export HUGGINGFACE_API_KEY="your_api_key_here"

      local hf_api_key = os.getenv("HUGGINGFACE_API_KEY")
      if not hf_api_key then
        vim.notify("[claudius.nvim] Hugging Face API key not found in environment variable HUGGINGFACE_API_KEY", vim.log.levels.WARN)
        return
      end

      require("claudius").setup({
        provider = "huggingface",
        api_key = hf_api_key,
        model = "starcoder/starcoder", -- Code generation model
        max_tokens = 512,              -- Max response tokens
      })

      -- Keymaps for using Claudius in normal mode
      local opts = { noremap = true, silent = true }
      -- Ask AI for code suggestion / completion
      vim.api.nvim_set_keymap("n", "<leader>ac", "<cmd>ClaudiusComplete<CR>", opts)
      -- Ask AI for explanation of code under cursor
      vim.api.nvim_set_keymap("n", "<leader>ae", "<cmd>ClaudiusExplain<CR>", opts)
      -- Ask AI to refactor selected code
      vim.api.nvim_set_keymap("v", "<leader>ar", "<cmd>ClaudiusRefactor<CR>", opts)
    end,
  },
}

