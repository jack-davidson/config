local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Tools
    use 'kdheepak/lazygit.nvim'
    use { 'TimUntersberger/neogit',
        requires = 'nvim-lua/plenary.nvim'
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = 'nvim-lua/plenary.nvim',
    }

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'folke/trouble.nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind.nvim'

    -- nvim-cmp Sources
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-vsnip'

    -- Snippets
    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'

    -- Language
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'windwp/nvim-ts-autotag'
    use 'norcalli/nvim-colorizer.lua'
    use 'fatih/vim-go'
    use "rafamadriz/friendly-snippets"

    -- UI/Appearance
    use 'startup-nvim/startup.nvim'
    use 'crispgm/nvim-tabline'
    use 'kyazdani42/nvim-web-devicons'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'arcticicestudio/nord-vim'
    use 'lewis6991/gitsigns.nvim'

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end
)

require('lsp')
require('lsp-ui')
require('cmp-config')
require('lualine-config')
require('telescope-config')
require('treesitter-config')

require'colorizer'.setup()
require('gitsigns').setup()
require("trouble").setup()

require("startup").setup {
    theme = "dashboard",
}

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
