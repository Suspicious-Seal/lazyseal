#!/bin/bash


alias py=python3
echo "alias py=python3" >> .bashrc

cd ~/.config/
rm -rf nvim
mkdir nvim
cd nvim

touch init.lua
echo "require('plugins')" >> init.lua

mkdir lua
cd lua

touch plugins.lua
echo "
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
end)" >> plugins.lua

