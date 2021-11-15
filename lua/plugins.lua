return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {
        'onsails/lspkind-nvim',
        config = function()
            require('configs.lspkind')
        end
    }
    use 'navarasu/onedark.nvim'
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
        'famiu/feline.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }, 
        config = function()
            require('configs.feline')
        end
    }
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require('configs.nvim-cmp')
        end,
    }
    use {
        'akinsho/bufferline.nvim', 
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
           require("configs.bufferline")
        end,
        after = 'nvim-tree.lua'
    }
    use 'kabouzeid/nvim-lspinstall'
    use {
        'glepnir/lspsaga.nvim',
        config = function()
            require('configs.lspsaga')
        end,
    }
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
