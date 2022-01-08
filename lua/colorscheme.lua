local colorscheme = "darkplus"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if status_ok then 
    vim.cmd('hi NvimTreeStatusLine guibg=#252525 guifg=#252525')
    vim.cmd('hi NvimTreeStatusLineNC guibg=#131b25 guifg=#131b25')
end

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
