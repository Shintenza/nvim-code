local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("configs.lsp.lsp-installer")
require("configs.lsp.handlers").setup()
require("configs.lsp.null-ls")

