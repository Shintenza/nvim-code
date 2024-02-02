local M = {
  "windwp/nvim-autopairs",
  commit = "096d0baecc34f6c5d8a6dd25851e9d5ad338209b",
  event = "InsertEnter",
  dependencies = {
    {
      "hrsh7th/nvim-cmp",
      event = {
        "InsertEnter",
        "CmdlineEnter",
      },
    },
  },
}

function M.config()
  require("nvim-autopairs").setup({
    check_ts = true, -- treesitter integration
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
  })

  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  local cmp = require("cmp")

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({}))
end

return M
