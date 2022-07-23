local status_ok, onedark = pcall(require, "darkplus")
if not status_ok then 
    vim.notify("colorscheme " .. colorscheme .. " not found!")
end
vim.cmd('hi VertSplit guibg=#017bce guifg=bg')
