return function(use)
    use { 'wbthomason/packer.nvim', }

    -- Tools
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim', config = require('config.telescope'), }
    use { 'numToStr/Navigator.nvim', config = require('config.navigator'), }
    use { 'kdhepak/lazygit.nvim', }

    -- LSP
    use { 'neovim/nvim-lspconfig', config = require('config.lsp'), }
    use { 'hrsh7th/nvim-cmp', requires = {
        -- completion sources
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-nvim-lsp',
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

    -- UI
    use { 'lukas-reineke/indent-blankline.nvim', config = require('config.indent_blankline'), }
    use { 'norcalli/nvim-colorizer.lua', config = require('config.colorizer'), }
    use { 'akinsho/bufferline.nvim', config = require('config.bufferline'), }
    use { 'startup-nvim/startup.nvim', config = require('config.startup'), }
    use { 'nvim-lualine/lualine.nvim', config = require('config.lualine'), }
    use { 'lewis6991/gitsigns.nvim', config = require('config.gitsigns'), }

    -- Colorschemes
    use { 'shaunsingh/nord.nvim', config = require('config.nord'), }
    use { 'ellisonleao/gruvbox.nvim' }
end
