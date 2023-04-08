local servers = {
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
    function(server_name)  -- default handler (optional)
        opts = {
            on_attach = require("configs.lsp.handlers").on_attach,
            capabilities = require("configs.lsp.handlers").capabilities,
        }

        if server_name == "jdtls" then goto continue end

       local require_ok, conf_opts = pcall(require, "configs.lsp.settings." .. server_name)
        if require_ok then
            opts = vim.tbl_deep_extend("force", conf_opts, opts)
        end

        lspconfig[server_name].setup(opts)
        ::continue::
    end,
}
