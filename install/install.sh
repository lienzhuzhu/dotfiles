#!/usr/bin/bash

# MUST INSTALL:
# - Rust
# - a Nerd Font
# - Neovim
# - ripgrep
# - fd
# - Wezterm
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
rm -rf ~/.config/nvim                                           # cleans out any existing nvim
ln -s "$pwd/nvim ~/.config/nvim"                                # create link
