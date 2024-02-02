local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
  commit = "12e92044d313c54c438bd786d11684c88f6f78cd",
  main = "ibl",
}

M.opts = {
  indent = { char = "▏" },
  scope = {
    enabled = false
  }

}

return M
