local status_ok, onedark = pcall(require, "onedark")
if not status_ok then 
    vim.notify("colorscheme " .. colorscheme .. " not found!")
end

onedark.setup {
    style = 'darker'
}

onedark.load()
