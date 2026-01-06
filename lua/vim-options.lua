vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")


local opts = { noremap = true, silent = true }



--show diagnostics
vim.diagnostic.open_float()

vim.g.mapleader = " "
--vim.g.maplocalleader = "\\"

-- key map for viewing the warnings
vim.keymap.set("n", "<leader>e", ":lua vim.diagnostic.setloclist() <CR>", {})


--tabs
vim.api.nvim_set_keymap("n", "<Leader>to", ":tabnew<CR>", opts)      -- open new tab
vim.api.nvim_set_keymap("n", "<Leader>tx", ":tabclose<CR>", opts)    -- close current tab
vim.api.nvim_set_keymap("n", "<Leader>tn", ":tabnext<CR>", opts)     -- go to next tab
vim.api.nvim_set_keymap("n", "<Leader>tp", ":tabprevious<CR>", opts) -- go to previous tab



--Buffer navigation
-- Previous buffer
vim.api.nvim_set_keymap("n", "<Leader>bp", ":bp<CR>", opts)
-- Next buffer
vim.api.nvim_set_keymap("n", "<Leader>bn", ":bn<CR>", opts)


-- leave insertMode and save the file by pressing jk
vim.keymap.set('i', 'jk', '<Esc>:w<CR>:echo "💥 " . expand("%:t") . " 👈🏾 has been saved 😎✌🏾 "<CR>',
  { noremap = true, silent = false })


-- enable clipboard integration
vim.opt.clipboard = 'unnamedplus' -- For Linux


-- Auto-adjust scrolloff to half the window height
vim.api.nvim_create_autocmd("VimResized", {
  callback = function()
    vim.opt.scrolloff = math.floor(vim.api.nvim_win_get_height(0) / 2)
  end,
})

-- Set initial scrolloff
vim.opt.scrolloff = math.floor(vim.api.nvim_win_get_height(0) / 2)

vim.opt.scrolloff = 10
