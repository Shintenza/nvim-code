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
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)    
    use 'wbthomason/packer.nvim'
    use {
        'onsails/lspkind-nvim',
        config = function()
            require('configs.lspkind')
        end
    }
    use "lunarvim/darkplus.nvim"
    use {
         'neovim/nvim-lspconfig',
         config = function()
             require("configs.nvim-lspconfig")
         end,
    }
    use {
         'kyazdani42/nvim-tree.lua',
         requires = 'kyazdani42/nvim-web-devicons',
         config = function()
             require('configs.nvim-tree')
         end,
     }
    use {
         'nvim-lualine/lualine.nvim',
         requires = {'kyazdani42/nvim-web-devicons', opt = true},
         config = function()
             require('configs.lualine')
         end,
     }
    -- Cmp
    use 'saadparwaiz1/cmp_luasnip'     -- Snippets source for nvim-cmp
    use {
         "hrsh7th/nvim-cmp",
         requires = {
             "hrsh7th/cmp-buffer",
             "hrsh7th/cmp-path",
             "hrsh7th/cmp-nvim-lsp",
         },
         config = function()
             require('configs.nvim-cmp')
         end,
    }

    -- Snippets 
    use 'L3MON4D3/LuaSnip'             -- Snippets plugin
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    use {
         'akinsho/bufferline.nvim', 
         requires = 'kyazdani42/nvim-web-devicons',
         config = function()
            require("configs.bufferline")
         end,
         after = 'nvim-tree.lua'
    }
    use 'williamboman/nvim-lsp-installer'
    use {
         'andweeb/presence.nvim',
         config = function()
             require('configs.presence')
         end,
     }
     use {
       "nvim-treesitter/nvim-treesitter",
       config = function()
          require "configs.treesitter"
       end,
    }
    use {
        'windwp/nvim-autopairs',
         config = function()
             require "configs.nvim_autopairs"
         end,
    }
    use {
        'akinsho/toggleterm.nvim',
         config = function()
             require 'configs.toggleterm'
         end,
    }
    use {
         'terrortylor/nvim-comment',
         config = function()
             require 'configs.nvim-comment'
         end,
    }
end)
