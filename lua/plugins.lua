local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require('packer.util').float()
        end,
    },
}

return packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Lsp
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'jose-elias-alvarez/null-ls.nvim'
    use "glepnir/lspsaga.nvim"

    -- Interface
    use 'LunarVim/darkplus.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'nvim-lualine/lualine.nvim'
    use 'akinsho/bufferline.nvim'
    use 'akinsho/toggleterm.nvim'
    use 'onsails/lspkind-nvim'
    use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }

    -- Cmp
    use { "hrsh7th/nvim-cmp",
        requires = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "saadparwaiz1/cmp_luasnip" } }
    use 'ray-x/lsp_signature.nvim'

    -- Snippets
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- Utils
    use "nvim-treesitter/nvim-treesitter"
    use 'windwp/nvim-autopairs'
    use 'numToStr/Comment.nvim'
    use "lukas-reineke/indent-blankline.nvim"

    -- Git
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
end)
