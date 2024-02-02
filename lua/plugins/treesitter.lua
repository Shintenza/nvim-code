local M = {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy",
    },
    {
      "nvim-tree/nvim-web-devicons",
      event = "VeryLazy",
    },
    {
      "windwp/nvim-ts-autotag",
      event = "VeryLazy",
    },
  },
}

function M.config()
  local treesitter = require("nvim-treesitter")
  local configs = require("nvim-treesitter.configs")

  configs.setup({
    autotag = {
      enable = true,
    },
    incremental_selection = { enable = true },
    ensure_installed = { "lua", "markdown", "markdown_inline" }, -- put the language you want in this array
    ignore_install = { "" },                                   -- List of parsers to ignore installing
    sync_install = false,                                      -- install languages synchronously (only applied to `ensure_installed`)
    highlight = {
      enable = true,                                           -- false will disable the whole extension
      disable = { "css" },                                     -- list of language that will be disabled
    },
    autopairs = {
      enable = true,
    },
    indent = { enable = true, disable = { "python" } },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  })
end

return M
