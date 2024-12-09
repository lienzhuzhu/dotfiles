# Pure Elegance
# by Lien Zhu
# https://github.com/lienzhuzhu/dotfiles

# prompt:
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)


# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'
zstyle ':vcs_info:*' enable git

setopt PROMPT_SUBST
PROMPT=$'%B%F{red}YT:AcademicCrashout%f%b in %F{white}%~%f on %B%F{red}${vcs_info_msg_0_}%f%b %B%F{blue}>%f%b '
