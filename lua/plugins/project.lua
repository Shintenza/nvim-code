local M = {
  "ahmedkhalf/project.nvim",
  lazy = false,
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
      event = "Bufenter",
      cmd = { "Telescope" },
    },
  },
}

function M.config()
  local project = require("project_nvim")
  project.setup({
    active = true,
    on_config_done = nil,
    manual_mode = false,
    detection_methods = { "pattern, lsp" },
    patterns = { ".git", "Makefile", "package.json" },
    show_hidden = true,
    silent_chdir = true,
    ignore_lsp = {},
    datapath = vim.fn.stdpath("data"),
  })

  local telescope = require("telescope")
  telescope.load_extension("projects")
end

return M
