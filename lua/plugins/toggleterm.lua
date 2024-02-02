local M = {
  "akinsho/toggleterm.nvim",
  commit = "b49df5cdce67a8964d1b027dae94bde212092b51",
  event = "VeryLazy",
}

function M.config()
  local toggleterm = require("toggleterm")
  toggleterm.setup({
    size = 15,
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "horizontal",
    close_on_exit = true,
    shell = vim.o.shell,
  })
end

return M
