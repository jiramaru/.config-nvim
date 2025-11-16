vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")

vim.g.mapleader = " "
--vim.g.maplocalleader = "\\"


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
