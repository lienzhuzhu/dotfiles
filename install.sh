#!/usr/bin/bash

# MUST INSTALL:
# - Rust
# - a Nerd Font
# - Neovim
# - ripgrep


# alacritty configs
rm -rf ~/.config/alacritty
ln -s $(pwd)/alacritty ~/.config/alacritty

# starship prompt config
rm -f ~/.config/starship.toml
ln -s $(pwd)/starship.toml ~/.config/starship.toml

# nvim configs
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim         # install packer
rm -rf ~/.config/nvim                                           # cleans out any existing nvim
ln -s $(pwd)/nvim ~/.config/nvim                                # create link
