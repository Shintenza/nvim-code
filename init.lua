require('plugins')
require('options')
require('keymaps')
require('colorscheme')

-- vim.cmd([[
--     function! CustomFoldText()
--       let indentation = indent(v:foldstart - 1)
--       let foldSize = 1 + v:foldend - v:foldstart
--       let foldSizeStr = " " . foldSize . " lines "
--       let foldLevelStr = repeat("+--", v:foldlevel)
--       let expansionString = repeat(" ", indentation)
--       return expansionString . foldLevelStr . foldSizeStr
--     endfunction
-- ]])
-- vim.cmd([[
--     augroup remember_folds
--     autocmd!
--     autocmd BufWinLeave * mkview
--     autocmd BufWinEnter * silent! loadview
--     augroup END
-- ]])
