local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = {
        {
            function()
                return 'ﮊ'
            end,
            color = { fg = '#000000', bg = "#E06C75" }, -- Sets highlighting of component
            padding = { left = 1, right = 1 }, -- We don't need space before this
            separator = {right = ' '},
        }
    },
    lualine_b = {
        {
            'filetype',
            color = { fg = '#ffffff', bg = '#2C3039' },
            icon_only = true,
            separator = {right = ''},
        },
        {
            'filename',
            color = { fg = '#ffffff', bg = '#2C3039' },
            separator = {right = ' '},
        },
        {
            'branch',
            color = { fg = '#ffffff', bg = '#262A32'},
            separator = {right = ' '},

        },
        {
            'diff',
            color = { fg = '#ffffff', bg = '#22262E'},
            symbols = {added = '落', modified = 'ﱴ ', removed = ' '},
            separator = {right = ' '},
            colored = false,
        },
    },
    lualine_c = {},
    lualine_x = {
        {
            'diagnostics',
            symbols = {error = ' ', warn = ' ', info = ' ', hint = 'H'},
            color = { fg = '#ffffff', bg = '#22262E'},
            separator = { left = ' ' },
        },
        {
             function()
                local msg = 'No Active Lsp'
                local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                  return msg
                end
                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                  end
                end
                return msg
              end,
              icon = ' LSP:',
              color = { fg = '#ffffff', bg = '#22262E' },
              separator = { left = ' ' },
        },
    },
    lualine_y = {
        {
            function()
                return ''
            end,
            color = { fg = '#ffffff', bg = '#2C3039' }, -- Sets highlighting of component
            padding = { left = 1, right = 1 }, -- We don't need space before this
            separator = { left = ' ' },
        },
        {
            'mode',
            color = { fg = '#ffffff', bg = '#2D3139' },
        },
    },
    lualine_z = {
        {
            function()
                return ' '
            end,
            color = { fg = '#000000', bg = '#E06C75' },
            padding = { left = 1, right = 1 }, -- We don't need space before this
            separator = { left = ' ' },
            padding = { right = 1 },
        },
    }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
