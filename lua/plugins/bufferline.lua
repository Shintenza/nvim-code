local M = {
  'akinsho/bufferline.nvim', 
  version = "*", 
  dependencies = 'nvim-tree/nvim-web-devicons'
}

function M.config()
  local status_ok, bufferline = pcall(require, "bufferline")
  bufferline.setup {
    options = {
      offsets = { { filetype = "NvimTree", text = "", padding = 0, highlight = "NvimTreeNormal" } },
    }
  }
end


return M
