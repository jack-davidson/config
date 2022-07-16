local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim', }
    use 'nvim-lua/plenary.nvim'

    -- Tools/Utility
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim',  }
    use { 'kyazdani42/nvim-tree.lua',  }
    use { 'numToStr/Navigator.nvim',  }
    use { 'linty-org/readline.nvim',  }
    use { 'numToStr/Comment.nvim',  }
    use { 'simrat39/symbols-outline.nvim', }
    use { 'kdheepak/lazygit.nvim', }
    use{ 'jakewvincent/mkdnflow.nvim', config = require('mkdnflow').setup({}), }

    -- LSP
    use { 'neovim/nvim-lsp' }
    use { 'hrsh7th/nvim-cmp', requires = {
        -- completion sources
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/cmp-path',
    },  }

    -- Snippets
    use { 'rafamadriz/friendly-snippets', }
    use { 'hrsh7th/vim-vsnip-integ', }
    use { 'hrsh7th/vim-vsnip', }

    -- Language
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',  }
    use { 'windwp/nvim-ts-autotag', }

    -- UI/Visuals
    use { 'lukas-reineke/indent-blankline.nvim',  }
    use { 'norcalli/nvim-colorizer.lua',  }
    use { "petertriho/nvim-scrollbar", config = require('scrollbar').setup{}, }
    use { 'akinsho/bufferline.nvim',  }
    use { 'startup-nvim/startup.nvim',  }
    use { 'nvim-lualine/lualine.nvim',  }
    use { 'lewis6991/gitsigns.nvim', config = require('gitsigns').setup{}, }
    use { 'kyazdani42/nvim-web-devicons', }

    -- Colorschemes
    use { 'shaunsingh/nord.nvim',  }
    use { 'ellisonleao/gruvbox.nvim' }

    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- https://github.com/mrjones2014/load-all.nvim
local scan = require('plenary.scandir')
for _, file in ipairs(scan.scan_dir(os.getenv('HOME') .. '/.config/nvim/lua/config', { depth = 0 })) do
  dofile(file)
end
