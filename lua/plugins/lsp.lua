local M = {
  "neovim/nvim-lspconfig",
  commit = "6f426c34c8e21af2f934e56be9d1198a507ecc9f",
  lazy = false,
  event = { BufReadPre },
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
}

function M.config()
  local cmp_nvim_lsp = require("cmp_nvim_lsp")

  M.capabilities = vim.lsp.protocol.make_client_capabilities()
  M.capabilities.textDocument.completion.completionItem.snippetSupport = true
  M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
  M.capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    virtual_text = false,
    signs = {
      active = signs,
    },
    underline = true,
    severity_sort = true,
  }

  vim.diagnostic.config(config)

  local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap

    keymap(bufnr, 'n', 'gD',               '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    keymap(bufnr, 'n', 'gd',               '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap(bufnr, 'n', 'gi',               '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    keymap(bufnr, 'n', 'gr',               '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    keymap(bufnr, 'n', '<C-k>',            '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    keymap(bufnr, 'n', '<leader>wa',       '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    keymap(bufnr, 'n', '<leader>wr',       '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    keymap(bufnr, 'n', '<leader>wl',       '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    keymap(bufnr, 'n', '<leader>fr',       '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
    keymap(bufnr, 'n', '<leader>D',        '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    keymap(bufnr, 'n', '<leader>e',        '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    keymap(bufnr, 'n', '<leader>q',        '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

    -- Lspsaga
    keymap(bufnr, "n", "gh",               "<cmd>Lspsaga lsp_finder<CR>", opts)
    keymap(bufnr, "n", "<leader>ca",       "<cmd>Lspsaga code_action<CR>", opts)
    keymap(bufnr, "v", "<leader>ca",       "<cmd><C-U>Lspsaga range_code_action<CR>", opts)
    keymap(bufnr, "n", "K",                "<cmd>Lspsaga hover_doc<CR>", { silent = true })
    keymap(bufnr, "n", "<leader>rn",       "<cmd>Lspsaga rename<CR>", opts)
    keymap(bufnr, "n", "<leader>cd",       "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    keymap(bufnr, "n", "<leader>o",        "<cmd>Lspsaga outline<CR>", opts)
    keymap(bufnr, "n", "<leader>t",        "<cmd>Lspsaga term_toggle<CR>", opts)
    keymap(bufnr, "n", "[d",               "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    keymap(bufnr, "n", "]d",               "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  end

  M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    if client.name == "tsserver" then
      client.server_capabilities.document_formatting = false
    end
    if client.name == "jdt.ls" then
      client.server_capabilities.document_formatting = false
      client.server_capabilities.textDocument.completion.completionItem.snippetSupport = false
    end

    local status_ok, illuminate = pcall(require, "illuminate")
    if not status_ok then
      return
    end
    illuminate.on_attach(client)
  end
end

return M
