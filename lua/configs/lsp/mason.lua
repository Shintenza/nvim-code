local servers = {
	"pyright",
    "clangd"
}

local settings = {
	ui = {
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 2,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

require("mason-lspconfig").setup_handlers {
    function (server) -- default handler (optional)
        opts = {
            on_attach = require("configs.lsp.handlers").on_attach,
            capabilities = require("configs.lsp.handlers").capabilities,
        }

        if server.name == "emmet_ls" then
            opts.filetypes = { "html", "typescriptreact", "javascriptreact" }
        end

        if server.name == "cssls" then 
            opts.filetypes = { "html", "typescriptreact", "javascriptreact", "css", "scss" }
        end

        if server.name == "jdtls" then goto continue end

        lspconfig[server].setup(opts)
        ::continue::
    end,
}
