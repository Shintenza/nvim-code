vim.opt.completeopt = "menuone,noselect"
local cmp = require'cmp'
local lspkind = require('lspkind')
local luasnip = require 'luasnip'

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end


cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
    },
    mapping = {
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            vim_item.abbr = string.sub(vim_item.abbr, 1, 70)
            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                buffer = "[BUF]",
            })[entry.source.name]
            return vim_item
        end
  },
})
