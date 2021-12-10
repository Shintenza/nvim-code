require('plugins')

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
local set = vim.opt

-- Set the behavior of tab
set.tabstop = 4 
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.termguicolors = true
set.number = true
set.mouse = 'a'
set.hidden = true
set.relativenumber = true
set.nu = true
set.incsearch = true
set.scrolloff = 8


vim.g.onedark_style = 'deep'
vim.cmd('colorscheme onedark')
vim.cmd('set nohlsearch')
vim.cmd('hi NvimTreeStatusLine guibg=#131b25 guifg=#131b25')
vim.cmd('hi NvimTreeStatusLineNC guibg=#131b25 guifg=#131b25')

vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-w>', '<C-w>w', {noremap = true})
vim.api.nvim_set_keymap('n', '<A-x>', ':bd<CR>', {noremap = true})
