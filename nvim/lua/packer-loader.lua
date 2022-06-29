local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local packer = nil
if packer == nil then
    packer = require 'packer'
    packer.init { disable_commands = true }
end

local use = packer.use
use 'wbthomason/packer.nvim'
require('plugins')(use)
-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all config
if packer_bootstrap then
        require('packer').sync()
end
