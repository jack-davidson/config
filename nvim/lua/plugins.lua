local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'

    -- Tools/Utility
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim',  }
 --   use 'kyazdani42/nvim-tree.lua'
    use 'linty-org/readline.nvim'
    use 'numToStr/Comment.nvim'
    use 'simrat39/symbols-outline.nvim'
    use 'kdheepak/lazygit.nvim'
    use 'jbyuki/venn.nvim'
    use 'jghauser/mkdir.nvim'
    use 'filipdutescu/renamer.nvim'
    use 'jghauser/follow-md-links.nvim'

    -- LSP
    use 'neovim/nvim-lsp'
    use { 'hrsh7th/nvim-cmp',
        requires = {
            -- completion sources
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/cmp-path',
        }
    }

    -- Snippets
    use 'rafamadriz/friendly-snippets'
    use 'hrsh7th/vim-vsnip-integ'
    use 'hrsh7th/vim-vsnip'

    -- Language
--    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',  }
 --   use 'windwp/nvim-ts-autotag'

    -- UI/Visuals
--    use 'lukas-reineke/indent-blankline.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'petertriho/nvim-scrollbar'
    use 'akinsho/bufferline.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- Colorschemes
    use 'shaunsingh/nord.nvim'
    use 'ellisonleao/gruvbox.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end

    -- Load config files in config/
    -- https://github.com/mrjones2014/load-all.nvim
    local ok, scan = pcall(require, 'plenary.scandir')
    if ok then
        for _, file in ipairs(scan.scan_dir(os.getenv('HOME') .. '/.config/nvim/lua/config', { depth = 0 })) do
            dofile(file)
        end
    end

    require('scrollbar').setup{}
    require('gitsigns').setup{}
    require('colorizer').setup()
    require('renamer').setup()
    require("symbols-outline").setup()
end)
