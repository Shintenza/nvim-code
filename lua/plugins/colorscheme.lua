local M = {
  "olimorris/onedarkpro.nvim",
  lazy = false,
  priority = 1000,
}

function M.config()
  vim.cmd("colorscheme onedark_vivid")
end

return M
