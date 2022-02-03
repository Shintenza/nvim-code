local status_ok, ts_config = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

ts_config.setup {
   ensure_installed = {
      "javascript",
      "typescript"
   },
   highlight = {
      enable = true,
      use_languagetree = true,
   },
}
