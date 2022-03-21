local opts = { noremap = false, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Normal mode

-- better window navigation
keymap('n', '<A-w>', '<C-w>w',  opts)
keymap('n', '<A-q>', '<C-w>q',  opts)
keymap("n", "<A-h>", "<C-w>h",  opts)
keymap("n", "<A-j>", "<C-w>j",  opts)
keymap("n", "<A-k>", "<C-w>k",  opts)
keymap("n", "<A-l>", "<C-w>l",  opts)

-- buffer navigation 
keymap('n', '<A-x>', ':bd!<CR>', opts)
keymap('n', '<A-[>', '<cmd>BufferLineCyclePrev<CR>', opts)
keymap('n', '<A-]>', '<cmd>BufferLineCycleNext<CR>', opts)

-- Nvim Tree
keymap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)

-- Telescope
keymap('n', '<C-f>', ':Telescope find_files<CR>', opts)

-- term
keymap('t', '<Esc>', '<C-\\><C-n>', opts)

-- window resize
keymap("n", "<A-Up>",   ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>",":vertical resize +2<CR>", opts)

-- Visual mode
-- indenting 
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("v", "<C-j>", ":m .+1<CR>==", opts)
keymap("v", "<C-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

