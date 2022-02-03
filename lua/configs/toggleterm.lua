local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

require("toggleterm").setup {
    open_mapping = [[<c-t>]],
}
