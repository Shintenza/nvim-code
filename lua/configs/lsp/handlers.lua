local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
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
end
local function lsp_keymaps(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>fr', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    -- buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    -- buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

    -- Lspsaga
    buf_set_keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
    buf_set_keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
    buf_set_keymap("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
    buf_set_keymap("n", "gs", "<Cmd>Lspsaga signature_help<CR>", opts)
    buf_set_keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
    buf_set_keymap("n", "<leader>gd", "<cmd>Lspsaga preview_definition<CR>", { silent = true })
    buf_set_keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({async=true})' ]]
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(client, bufnr)
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

return M
