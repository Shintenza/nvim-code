require("bufferline").setup{
    options = {
        offsets = {{filetype = "NvimTree", text = ""}},
    }
}
vim.api.nvim_set_keymap('n', '[b', '<cmd>BufferLineCyclePrev<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', ']b', '<cmd>BufferLineCycleNext<CR>', {noremap = true})
