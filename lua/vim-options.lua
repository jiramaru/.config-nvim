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
