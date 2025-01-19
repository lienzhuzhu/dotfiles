#+------------------+#
# Lien Zhu's zshrc   #
#+------------------+#


pfetch # style


#+---------------------+#
# Source External Files #
#+---------------------+#
source "${ZDOTDIR}/env.sh"
source "${ZDOTDIR}/aliases.sh"
source "${ZDOTDIR}/functions.sh"

#+-- Prompt --+#
source "${ZDOTDIR}/prompt.sh"


#+-----------------------+#
# Basic Auto/tab Complete #
#+-----------------------+#
fpath=("${ZDOTDIR}/completions" $fpath)
autoload -U compinit; compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)   # Include hidden files.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'


#+--------+#
# Vim Mode #
#+--------+#
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd vv edit-command-line
bindkey -v
bindkey "^?" backward-delete-char


#+---------------------------------+#
# Use Vim Keys In Tab Complete Menu #
#+---------------------------------+#
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


#+------------------------+#
# ls Command Output Colors #
#+------------------------+#
#export LS_COLORS="di=1;33;40" # Linux
export LSCOLORS=dxfxcxdxbxgexexabagacad # BSD/ MacOS
export CLICOLOR=1


zle_highlight=('paste:none') # Disables highlight after pasting

bindkey '^R' history-incremental-search-backward


#+-----------+#
# pyenv setup
#+-----------+#
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
