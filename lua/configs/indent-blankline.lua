local status_ok, indent_blankline = pcall(require, "indent_blankline")

indent_blankline.setup {
  filetype_exclude = {'NvimTree'},
  use_treesitter = true,
  buftype_exclude = {'terminal'},
  show_first_indent_level = false
}
