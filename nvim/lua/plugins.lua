return function(use)
    use { 'wbthomason/packer.nvim', }

    -- Tools/Utility
--    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim', config = require('config.telescope'), }
    use { 'kyazdani42/nvim-tree.lua', config = require('config.nvim-tree'), }
    use { 'numToStr/Navigator.nvim', config = require('config.navigator'), }
    use { 'linty-org/readline.nvim', config = require('config.readline'), }
    use { 'numToStr/Comment.nvim', config = require('Comment').setup(), }
    use { 'simrat39/symbols-outline.nvim', }
    use { 'kdheepak/lazygit.nvim', }

    -- LSP
    use { 'neovim/nvim-lspconfig', config = require('config.lsp'), }
    use { 'hrsh7th/nvim-cmp', requires = {
        -- completion sources
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/cmp-path',
    }, config = require('config.cmp'), }

    -- Snippets
    use { 'rafamadriz/friendly-snippets', }
    use { 'hrsh7th/vim-vsnip-integ', }
    use { 'hrsh7th/vim-vsnip', }

    -- Language
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = require('config.treesitter'), }
    use { 'windwp/nvim-ts-autotag', }

    -- UI/Visuals
    use { 'lukas-reineke/indent-blankline.nvim', config = require('config.indent_blankline'), }
    use { 'norcalli/nvim-colorizer.lua', config = require('config.colorizer'), }
    use { "petertriho/nvim-scrollbar", config = require('scrollbar').setup{} }
    use { 'akinsho/bufferline.nvim', config = require('config.bufferline'), }
    use { 'startup-nvim/startup.nvim', config = require('config.startup'), }
    use { 'nvim-lualine/lualine.nvim', config = require('config.lualine'), }
    use { 'lewis6991/gitsigns.nvim', config = require('config.gitsigns'), }
    use { 'kyazdani42/nvim-web-devicons', }

    -- Colorschemes
    use { 'shaunsingh/nord.nvim', config = require('config.nord'), }
    use { 'ellisonleao/gruvbox.nvim' }
end
