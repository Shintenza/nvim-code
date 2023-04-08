local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
	size = 15,
	hide_numbers = true,               -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	close_on_exit = true,
    direction = 'horizontal',          -- 'vertical' | 'horizontal' | 'window' | 'float'
	shell = vim.o.shell,
	float_opts = {
        border = 'single',
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})
