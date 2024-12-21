#!/usr/bin/env bash

# macos/install.sh
# Author: Lien Zhu
# Description: Installs dotfiles for MacOS.

# MUST INSTALL:
# - Rust?
# - a Nerd Font
# - Neovim
# - ripgrep
# - fd
# - Wezterm

# Resolve the script's full path
SCRIPT_PATH="$(realpath "$0")"

# Get the parent directory of the script
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

# TODO: Make this interactive. Read in the user specified dotfiles directory.
DOTFILES_DIR="${HOME}/dotfiles"


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

# INSTALL: homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# TODO: Make this a loop or function
brew install fd ripgrep rust




rm -rf "${HOME}/.local/share/nvim" #TODO: Use env variables, the problem is ZDOTDIR and XDG_* might not be exported yet...
rm -rf "${XDG_CONFIG_HOME}"
ln -s "${DOTFILES_DIR}/config-mac ~/.config"
