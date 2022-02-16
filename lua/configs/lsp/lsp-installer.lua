local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("configs.lsp.handlers").on_attach,
		capabilities = require("configs.lsp.handlers").capabilities,
	}
    if server.name == "emmet_ls" then
        opts.filetypes = { "html", "typescriptreact", "javascriptreact" }
    end
	server:setup(opts)
end)

