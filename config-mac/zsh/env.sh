export VISUAL=nvim
export EDITOR=nvim
export PASSWORD_STORE_DIR="${XDG_DATA_HOME}/password-store"

export HISTSIZE=10000                               # Maximum events for internal history
export SAVEHIST=10000                               # Maximum events in history file
export HISTFILE="${XDG_CACHE_HOME}/.zsh_history"

## CACHE Paths ##
export YARN_CACHE_FOLDER="${XDG_CACHE_HOME}/yarn"
export npm_config_cache="${XDG_CACHE_HOME}/npm"

export GOPATH="${HOME}/armory/go"
export PATH="$GOPATH/bin:$PATH"

export YAZI_CONFIG_HOME="${XDG_CONFIG_HOME}/yazi"
