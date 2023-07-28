local M = {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  commit = "cae5fdf035ee92c407a29ee2ccfcff503d2be7f1",
}

function M.config()
  require("onedark").setup({
    style = "warmer",
  })
  require("onedark").load()

  vim.cmd("highlight FoldColumn guibg=Normal")
  if vim.fn.hlexists("NvimTreeNormal") and vim.fn.hlexists("NvimTreeWinSeparator") then
    local bg = vim.api.nvim_get_hl_by_name("NvimTreeNormal", true).guibg
    vim.cmd("highlight NvimTreeWinSeparator guifg=bg guibg=bg")
  end
end

return M
