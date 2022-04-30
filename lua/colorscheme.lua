local status_ok, onedark = pcall(require, "onedark")
if not status_ok then 
    vim.notify("colorscheme " .. colorscheme .. " not found!")
end

onedark.setup {
    style = 'darker'
}
onedark.load()
vim.cmd('hi NvimTreeWinSeparator guibg=#171B21 guifg=#171B21')
