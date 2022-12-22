local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "configs.lsp.mason"
require("configs.lsp.handlers").setup()
require "configs.lsp.null-ls"
