local M = {
  "numToStr/Comment.nvim",
  commit = "176e85eeb63f1a5970d6b88f1725039d85ca0055",
  event = "VeryLazy",
}

function M.config()
  local status_ok, comment = pcall(require, "Comment")
  if not status_ok then
    return
  end
  comment.setup({
    padding = true,
    sticky = true,
    ignore = nil,

    toggler = {
      line = "gcc",
      block = "gbc",
    },

    opleader = {
      line = "gc",
      block = "gb",
    },

    extra = {
      above = "gcO",
      below = "gco",
      eol = "gcA",
    },

    mappings = {
      basic = true,
      extra = true,
      extended = false,
    },
    pre_hook = nil,
    post_hook = nil,
  })
end
return M
