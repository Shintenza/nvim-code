local M = {
  "williamboman/mason.nvim",
  commit = "c43eeb5614a09dc17c03a7fb49de2e05de203924",
  cmd = "Mason",
  event = "BufReadPre",
  dependencies = {
    {
      "williamboman/mason-lspconfig.nvim",
      commit = "56e435e09f8729af2d41973e81a0db440f8fe9c9",
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      commit = "db09b6c691def0038c456551e4e2772186449f35",
    },
    {
      "jay-babu/mason-null-ls.nvim",
      commit = "ae0c5fa57468ac65617f1bf821ba0c3a1e251f0c",
    },
  },
}

function M.config()
  local servers = {
    "clangd",
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
  require("null-ls").setup()
  require("mason-null-ls").setup({
    ensure_installed = { "prettierd", "stylua" },
    automatic_installation = true,
    handlers = {},
  })

  local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
  if not lspconfig_status_ok then
    return
  end

  local opts = {}

  require("mason-lspconfig").setup_handlers({
    function(server_name) -- default handler (optional)
      opts = {
        on_attach = require("plugins.lsp").on_attach,
        capabilities = require("plugins.lsp").capabilities,
      }
      if server_name == "jdtls" then
        goto continue
      end
      lspconfig[server_name].setup(opts)
      ::continue::
    end,
  })
end

return M
