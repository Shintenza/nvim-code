local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local colors = {
    bg = '#668ee3',
    fg = '#282c34'
}

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
    color = { fg = colors.fg, bg = colors.bg },
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
    color = { fg = colors.fg, bg = colors.bg },
    cond = hide_in_width,
}

local mode = {
	"mode",
    color = { fg = colors.fg, bg = colors.bg },
	fmt = function(str)
		return "-- " .. str .. " --"
	end,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
    color = { fg = colors.fg, bg = colors.bg },
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
    color = { fg = colors.fg, bg = colors.bg },
}

local location = {
	"location",
	padding = 0,
    color = { fg = colors.fg, bg = colors.bg },
}
local encoding = {
    "encoding",
    color = { fg = colors.fg, bg = colors.bg },
}

-- cool function for progress
local progress = {
    function()
        local current_line = vim.fn.line(".")
        local total_lines = vim.fn.line("$")
        local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
        local line_ratio = current_line / total_lines
        local index = math.ceil(line_ratio * #chars)
        return chars[index]
    end,
    color = { fg = colors.fg, bg = colors.bg },
}

local spaces = {
    function()
    	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end,
    color = { fg = colors.fg, bg = colors.bg },
}

lualine.setup({
	options = {
		icons_enabled = true,
        theme = {
            normal = { 
                a = { bg = colors.bg, fg = colors.fg },
                b = { bg = colors.bg, fg = colors.fg },
                c = { bg = colors.bg, fg = colors.fg },
            },
        },
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		always_divide_middle = true,
        globalstatus = true,

        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
	},
	sections = {
		lualine_a = { branch, diagnostics },
		lualine_b = { mode },
		lualine_c = {},
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { diff, spaces, encoding, filetype },
		lualine_y = { location },
		lualine_z = { progress },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
