return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {
        'onsails/lspkind-nvim',
        config = function()
            require('configs.lspkind')
        end
    }
    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require('configs.lsp-signature')
        end,
    }
    use 'joshdick/onedark.vim'
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
        config = function()
            require('configs.feline')
        end,
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
end)
