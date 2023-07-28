local M = {
  "ahmedkhalf/project.nvim",
  commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4",
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
    detection_methods = { "pattern" },
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
