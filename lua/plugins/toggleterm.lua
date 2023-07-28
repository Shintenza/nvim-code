local M = {
  "akinsho/toggleterm.nvim",
  commit = "00c13dccc78c09fa5da4c5edda990a363e75035e",
  event = "VeryLazy",
}

function M.config()
  local toggleterm = require("toggleterm")
  toggleterm.setup({
    size = 15,
    open_mapping = [[<c-t>]],
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
