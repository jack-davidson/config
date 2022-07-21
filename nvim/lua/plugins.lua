local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'

    -- Tools/Utility
    use { 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim',  }
    use 'kyazdani42/nvim-tree.lua'
    use 'numToStr/Navigator.nvim'
    use 'linty-org/readline.nvim'
    use 'numToStr/Comment.nvim'
    use 'simrat39/symbols-outline.nvim'
    use 'kdheepak/lazygit.nvim'
    use 'jakewvincent/mkdnflow.nvim'
    use 'jbyuki/venn.nvim'
    use 'jghauser/mkdir.nvim'
    use 'filipdutescu/renamer.nvim'

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
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',  }
    use 'windwp/nvim-ts-autotag'

    -- UI/Visuals
    use 'lukas-reineke/indent-blankline.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'petertriho/nvim-scrollbar'
    use 'akinsho/bufferline.nvim'
    use 'startup-nvim/startup.nvim'
    use 'nvim-lualine/lualine.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- Colorschemes
    use 'shaunsingh/nord.nvim'
    use 'ellisonleao/gruvbox.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)

-- Load config files in config/
-- https://github.com/mrjones2014/load-all.nvim
local ok, scan = pcall(require, 'plenary.scandir')
if ok then
    for _, file in ipairs(scan.scan_dir(os.getenv('HOME') .. '/.config/nvim/lua/config', { depth = 0 })) do
        dofile(file)
    end
end

require('mkdnflow').setup({})
require('scrollbar').setup{}
require('gitsigns').setup{}
require('colorizer').setup()
require('renamer').setup()

-- venn.nvim: enable or disable keymappings
function _G.Toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
        vim.b.venn_enabled = true
        vim.cmd[[setlocal ve=all]]
        -- draw a line on HJKL keystokes
        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
        -- draw a box by pressing "f" with visual selection
        vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
    else
        vim.cmd[[setlocal ve=]]
        vim.cmd[[mapclear <buffer>]]
        vim.b.venn_enabled = nil
    end
end

-- toggle keymappings for venn using <leader>v
vim.api.nvim_set_keymap('n', '<leader>e', ":lua Toggle_venn()<CR>", { noremap = true})
