vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("n","<esc>", ":nohlsearch<CR>", { desc = "No highlight"})
