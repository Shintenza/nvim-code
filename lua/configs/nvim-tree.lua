vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', {noremap = true})

vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_indent_markers = 0 
vim.g.nvim_tree_tab_open = 1
vim.g.nvim_tree_update_cwd = 1
vim.g.nvim_tree_auto_open = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_side = "left"
vim.g.nvim_tree_disable_netrw = 1

vim.g.nvim_tree_icons = {
   default = "",
   symlink = "",
   git = {
      deleted = "",
      ignored = "◌",
      renamed = "➜",
      staged = "✓",
      unmerged = "",
      unstaged = "✗",
      untracked = "★",
   },
   folder = {
      -- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front            ofthe default and opened folders below!
      -- arrow_open = "",
      -- arrow_closed = "",
      default = "",
      empty = "", -- 
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
   },
}
