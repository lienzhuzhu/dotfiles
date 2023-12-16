#!/usr/bin/bash

# MUST INSTALL:
# - Rust
# - a Nerd Font
# - Neovim
# - ripgrep
# - fd
# - Alacritty
# - Starship.rs



# Detect the OS
if [[ "$(uname)" == "Darwin" ]]; then
    this_system="macOS"
elif [[ -f /etc/os-release ]]; then
    . /etc/os-release
    if [[ $NAME == "Ubuntu" ]]; then
        this_system="Ubuntu"
    else
        echo "This OS is not macOS or Ubuntu"
        exit 1
    fi
else
    echo "This OS is not macOS or Ubuntu"
    exit 1
fi

echo "This system is $this_system"


if [[ "$this_system" == "macOS" ]]; then
    echo "The system is macOS"
else
    echo "The system is not macOS"
fi



repo_dir=$(pwd)

# INSTALL: dependencies for Neovim file functionality
if [[ "$this_system" == "macOS" ]]; then
    brew install fd ripgrep
else
    # not sure
fi


# INSTALL: Rust - requires interaction
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


# nvim configs
rm -rf ~/.local/share/nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim         # install packer
rm -rf ~/.config/nvim                                           # cleans out any existing nvim
ln -s "$pwd/nvim ~/.config/nvim"                                # create link


# INSTALL: alacritty
git clone https://github.com/alacritty/alacritty.git ~/alacritty
cd ~/alacritty
rustup override set stable # ensure the right version of Rust compiler
rustup update stable
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
if [[ "$this_system" == "macOS" ]]; then
    make app
    cp -r target/release/osx/Alacritty.app /Applications/
else
    cargo build --release
    sudo cp target/release/alacritty /usr/bin/
fi


# CONFIG: alacritty
cd "$repo_dir"
rm -rf ~/.config/alacritty
ln -s "$repo_dir/alacritty ~/.config/alacritty"
cd ~/.config/alacritty
alacritty migrate
rm alacritty.yml


# INSTALL tmux TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


# starship prompt config
cd "$repo_dir"
rm -f ~/.config/starship.toml
ln -s "$repo_dir/starship.toml ~/.config/starship.toml"
