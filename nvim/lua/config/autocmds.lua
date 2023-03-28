-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_command('augroup AutoCreateDirectory')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd BufWritePre * silent! execute "!mkdir -p " .. shellescape(expand("%:p:h"))')
vim.api.nvim_command('augroup END')
