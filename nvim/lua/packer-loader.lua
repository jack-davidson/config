local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local packer = require 'packer'
packer.init { disable_commands = true }

packer.use 'wbthomason/packer.nvim'
require('plugins')(packer.use) -- pass packer.use to plugin function

if packer_bootstrap then
        require('packer').sync()
end
