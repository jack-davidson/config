local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim', }

    -- Tools/Utility
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim', config = function() require('config.telescope') end, }
    use { 'kyazdani42/nvim-tree.lua', config = function() require('config.nvim-tree') end, }
    use { 'numToStr/Navigator.nvim', config = function() require('config.navigator') end, }
    use { 'linty-org/readline.nvim', config = function() require('config.readline') end, }
    use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end, }
    use { 'simrat39/symbols-outline.nvim', }
    use { 'kdheepak/lazygit.nvim', }

    -- LSP
    use { 'neovim/nvim-lspconfig', config = function() require('config.lsp') end, }
    use { 'hrsh7th/nvim-cmp', requires = {
        -- completion sources
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/cmp-path',
    }, config = function() require('config.cmp') end, }

    -- Snippets
    use { 'rafamadriz/friendly-snippets', }
    use { 'hrsh7th/vim-vsnip-integ', }
    use { 'hrsh7th/vim-vsnip', }

    -- Language
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require('config.treesitter') end, }
    use { 'windwp/nvim-ts-autotag', }

    -- UI/Visuals
    use { 'lukas-reineke/indent-blankline.nvim', config = function() require('config.indent_blankline') end, }
    use { 'norcalli/nvim-colorizer.lua', config = function() require('config.colorizer') end, }
    use { "petertriho/nvim-scrollbar", config = function() require('scrollbar').setup{} end, }
    use { 'akinsho/bufferline.nvim', config = function() require('config.bufferline') end, }
    use { 'startup-nvim/startup.nvim', config = function() require('config.startup') end, }
    use { 'nvim-lualine/lualine.nvim', config = function() require('config.lualine') end, }
    use { 'lewis6991/gitsigns.nvim', config = function() require('config.gitsigns') end, }
    use { 'kyazdani42/nvim-web-devicons', }

    -- Colorschemes
    use { 'shaunsingh/nord.nvim', config = function() require('config.nord') end, }
    use { 'ellisonleao/gruvbox.nvim' }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
