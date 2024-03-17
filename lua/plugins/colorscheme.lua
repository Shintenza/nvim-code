local M = {
  "jesseleite/nvim-noirbuddy",
  dependencies = {
    { "tjdevries/colorbuddy.nvim", branch = "dev" },
  },
  lazy = false,
  priority = 1000,
  opts = {
    preset = "miami-nights",
  },
}


return M
