neofetch # fancy

eval "$(starship init zsh)" # use starship prompt
eval "$(pyenv init -)"
eval "$(rbenv init -)"

alias vim='nvim'
alias python='python3'
alias ls='colorls --sd -a'

# colorls --tree alias
function lt() {
    if [[ -n $1 ]]; then
        colorls --tree=$1
    else
        colorls --tree
    fi
}

# disables the highlighting behavior when pasting
zle_highlight=('paste:none') 


### ENV Variables ###

export VISUAL=nvim
export EDITOR=nvim
export PYENV_ROOT="~/.pyenv"

## CACHE Paths ##

export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
export YARN_CACHE_FOLDER="$XDG_CACHE_HOME/yarn"
export npm_config_cache="$XDG_CACHE_HOME/npm"

## Basic Auto/tab Complete ##

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


### Vim Mode ###

autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd vv edit-command-line
bindkey -v
bindkey "^?" backward-delete-char

## Use Vim Keys In Tab Complete Menu ##
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

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

bindkey '^R' history-incremental-search-backward


## ls Command Output Colors ##

#export LS_COLORS="di=1;33;40" # Linux
export LSCOLORS=dxfxcxdxbxgexexabagacad # BSD/ MacOS
export CLICOLOR=1

function zsh_add_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then 
        # For plugins
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    fi
}

zsh_add_plugin "zsh-users/zsh-autosuggestions"
#zsh_add_plugin "zsh-users/zsh-syntax-highlighting"

export ZSH_AUTOSUGGEST_MANUAL_REBIND=true

bindkey '^[[Z' autosuggest-accept
