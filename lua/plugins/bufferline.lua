local M = {
  "akinsho/bufferline.nvim",
  commit = "99f0932365b34e22549ff58e1bea388465d15e99",
  event = { "BufReadPre", "BufAdd", "BufNew", "BufReadPost" },
  dependencies = {
      {
        "famiu/bufdelete.nvim",
        commit = "8933abc09df6c381d47dc271b1ee5d266541448e",
      },
    },
}

function M.config()
  local bufferline = require "bufferline"
  bufferline.setup {
      options = {
          numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
          close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
          right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
          left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
          middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
          indicator = {
              icon = '▎', -- this should be omitted if indicator style is not 'icon'
              style = 'icon',
          },
          buffer_close_icon = "",
          modified_icon = "●",
          close_icon = "",
          left_trunc_marker = "",
          right_trunc_marker = "",
          max_name_length = 30,
          max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
          tab_size = 21,
          diagnostics = false, -- | "nvim_lsp" | "coc",
          diagnostics_update_in_insert = false,
          offsets = { { filetype = "NvimTree", text = "", padding = 0, highlight = "NvimTreeNormal" } },
          show_buffer_icons = true,
          show_buffer_close_icons = true,
          show_close_icon = true,
          show_tab_indicators = true,
          persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
          separator_style = "none", -- | "thick" | "thin" | { 'any', 'any' },
          enforce_regular_tabs = true,
          always_show_bufferline = true,
      },
      highlights = {
          indicator_selected = {
              fg = { attribute = "fg", highlight = "LspDiagnosticsDefaultHint" },
              bg = { attribute = "bg", highlight = "Normal" },
          },
      }
  }
end

return M
