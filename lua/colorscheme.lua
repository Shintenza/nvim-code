local status_ok, onedark = pcall(require, "onedark")
if not status_ok then 
    vim.notify("colorscheme " .. colorscheme .. " not found!")
end

vim.cmd[[colorscheme onedark]]

if vim.fn.hlexists('SagaBorder') and vim.fn.hlexists('SagaNormal') then
    vim.cmd('highlight! link SagaBorder SagaNormal')
end


if vim.fn.hlexists('NvimTreeNormal') and vim.fn.hlexists('NvimTreeWinSeparator') then
    local bg = vim.api.nvim_get_hl_by_name("NvimTreeNormal", true).guibg
    vim.cmd("highlight NvimTreeWinSeparator guifg=bg")
end
