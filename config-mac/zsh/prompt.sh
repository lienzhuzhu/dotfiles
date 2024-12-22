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
precmd() {
    vcs_info
    check_unstaged_changes
}

# Function to check if there are unstaged changes in a Git repo
check_unstaged_changes() {
    GIT_UNSTAGED_ICON=""  # Reset the icon
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        if ! git diff --quiet; then
            GIT_UNSTAGED_ICON="%F{red} %f"  # Red  icon for unstaged changes
        fi
    fi
}

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' on %B%F{red}%b%f'
zstyle ':vcs_info:*' enable git

setopt PROMPT_SUBST
PROMPT=$'%B%F{red}YT:AcademicCrashout%f%b in %F{white}%~%f${vcs_info_msg_0_}${GIT_UNSTAGED_ICON} %B%F{blue}>%f%b '
