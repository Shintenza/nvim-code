local M = {
  "navarasu/onedark.nvim",
  lazy = false,
  priority = 1000,
  commit = "1230aaf2a427b2c5b73aba6e4a9a5881d3e69429",
}

function M.config()
  require("onedark").setup({
    style = "darker",
  })
  require("onedark").load()

  vim.cmd("highlight FoldColumn guibg=Normal")
  vim.cmd("highlight NvimTreeWinSeparator guifg=bg guibg=bg")
end

return M
