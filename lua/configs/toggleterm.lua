vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})
require("toggleterm").setup {
    open_mapping = [[<c-t>]],
}
