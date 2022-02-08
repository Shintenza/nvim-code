local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end
local status_ok, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not status_ok then
  return
end

local status_ok, nvim_autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

cmp.event:on(
	"confirm_done",
	cmp_autopairs.on_confirm_done()
)
nvim_autopairs.setup{}
