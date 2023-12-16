neofetch # fancy

eval "$(starship init zsh)" # use starship prompt

alias vim='nvim'
alias python='python3'


# ENV variables
export VISUAL=nvim
export EDITOR=nvim

bindkey '^R' history-incremental-search-backward


# vim mode
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd vv edit-command-line
bindkey -v
bindkey "^?" backward-delete-char

function zle-keymap-select zle-line-init zle-line-finish {
    if [[ ${KEYMAP} == vicmd ]] ||
       [[ $1 = 'block' ]]; then
        echo -ne '\e[2 q'
    elif [[ ${KEYMAP} == main ]] ||
         [[ ${KEYMAP} == viins ]] ||
         [[ $1 = 'beam' ]]; then
        echo -ne '\e[6 q'
    fi
}
zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select


# makes sure zsh acknowledges it is running on alacritty
#export TERM=alacritty

# output colors
export LS_COLORS="di=1;33;40" # Linux
export LSCOLORS=Exfxcxdxbxgexexabagacad # BSD/ MacOS
