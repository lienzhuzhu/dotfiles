#!/usr/bin/bash

# nvim configs
# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
rm -rf ~/.config/nvim
ln -s $(pwd)/nvim ~/.config/nvim
