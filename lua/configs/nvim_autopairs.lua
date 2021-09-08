local autopairs = require("nvim-autopairs")
local autopairs_completion = require("nvim-autopairs.completion.cmp")


autopairs.setup()
autopairs_completion.setup {
   map_complete = true, -- insert () func completion
   map_cr = true,
}
