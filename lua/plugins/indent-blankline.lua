local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
  main = "ibl",
}

M.opts = {
  indent = { char = "▏" },
  scope = {
    enabled = false
  }

}

return M
