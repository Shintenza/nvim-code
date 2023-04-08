local status_ok, onedark = pcall(require, "onedark")
if not status_ok then 
    vim.notify("colorscheme " .. colorscheme .. " not found!")
end

vim.cmd[[colorscheme onedark]]

if vim.fn.hlexists('SagaBorder') and vim.fn.hlexists('SagaNormal') then
    vim.cmd('highlight! link SagaBorder SagaNormal')
end

