local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Tools
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim', config = require('plugins.telescope'), }
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use 'kdheepak/lazygit.nvim'

    -- LSP
    use { 'neovim/nvim-lspconfig', config = function() require('plugins.lsp') require('plugins.lsp-ui') end, }
    use { 'folke/trouble.nvim', config = require('plugins.trouble'), }
    use { 'hrsh7th/nvim-cmp', config = require('plugins.cmp'), }
    use 'hrsh7th/cmp-nvim-lsp'

    -- nvim-cmp Sources
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-path'

    -- Snippets
    use 'hrsh7th/vim-vsnip-integ'
    use 'hrsh7th/vim-vsnip'

    -- Language
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = require('plugins.treesitter'), }
    use { 'norcalli/nvim-colorizer.lua', config = require('plugins.colorizer'), }
    use "rafamadriz/friendly-snippets"
    use 'windwp/nvim-ts-autotag'
    use 'fatih/vim-go'

    -- UI/Appearance
    use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons', config = require('plugins.bufferline'), }
    use { 'lukas-reineke/indent-blankline.nvim', config = require('plugins.indent_blankline'), }
    use { 'startup-nvim/startup.nvim', config = require('plugins.startup'), }
    use { 'nvim-lualine/lualine.nvim', config = require('plugins.lualine'), }
    use { 'lewis6991/gitsigns.nvim', config = require('plugins.gitsigns'), }
    use 'kyazdani42/nvim-web-devicons'
    use 'shaunsingh/nord.nvim'
    use 'crispgm/nvim-tabline'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end
)
