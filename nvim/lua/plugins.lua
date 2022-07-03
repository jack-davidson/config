return function(use)
    use { 'wbthomason/packer.nvim', }

    -- Tools
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim', config = require('config.telescope'), }
    use { 'numToStr/Navigator.nvim', config = require('config.navigator'), }
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use { 'kdheepak/lazygit.nvim', }

    -- LSP
    use { 'folke/trouble.nvim', config = require('config.trouble'), }
    use { 'neovim/nvim-lspconfig', config = require('config.lsp'), }
    use { 'hrsh7th/nvim-cmp', config = require('config.cmp'), }
    use { 'hrsh7th/cmp-nvim-lsp', }

    -- nvim-cmp Sources
    use { 'hrsh7th/cmp-nvim-lsp-signature-help', }
    use { 'hrsh7th/cmp-buffer', }
    use { 'hrsh7th/cmp-vsnip', }
    use { 'hrsh7th/cmp-path', }

    -- Snippets
    use { 'hrsh7th/vim-vsnip-integ', }
    use { 'hrsh7th/vim-vsnip', }

    -- Language
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = require('config.treesitter'), }
    use { 'norcalli/nvim-colorizer.lua', config = require('config.colorizer'), }
    use { 'rafamadriz/friendly-snippets', }
    use { 'windwp/nvim-ts-autotag', }
    use { 'fatih/vim-go', }

    -- UI/Appearance
    use { 'lukas-reineke/indent-blankline.nvim', config = require('config.indent_blankline'), }
    use { 'akinsho/bufferline.nvim', config = require('config.bufferline'), }
    use { 'startup-nvim/startup.nvim', config = require('config.startup'), }
    use { 'nvim-lualine/lualine.nvim', config = require('config.lualine'), }
    use { 'lewis6991/gitsigns.nvim', config = require('config.gitsigns'), }
    use { 'shaunsingh/nord.nvim', config = require('config.nord'), }
    use { 'ellisonleao/gruvbox.nvim' }
    use { 'crispgm/nvim-tabline', }
end
