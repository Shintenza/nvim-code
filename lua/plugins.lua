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
         'nvim-lualine/lualine.nvim',
         requires = {'kyazdani42/nvim-web-devicons', opt = true},
         config = function()
             require('configs.lualine')
         end,
     }
     use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
     use 'L3MON4D3/LuaSnip' -- Snippets plugin
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
