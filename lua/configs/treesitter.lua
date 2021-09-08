local ts_config = require("nvim-treesitter.configs")

ts_config.setup {
   ensure_installed = {
      "javascript",
      "typescript"
   },
   highlight = {
      enable = true,
      use_languagetree = true,
   },
}
