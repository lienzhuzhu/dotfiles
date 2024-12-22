# Elegance Over All
# by Lien Zhu
# https://github.com/lienzhuzhu/dotfiles

# Load version control information
autoload -Uz vcs_info
precmd() {
    check_unstaged_changes
    # Dynamically update the vcs_info format to include the unstaged icon
    zstyle ':vcs_info:git:*' formats " on %B%F{red}%b%f${GIT_UNSTAGED_ICON}"
    vcs_info
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

# Enable vcs_info for git
zstyle ':vcs_info:*' enable git

setopt PROMPT_SUBST
PROMPT=$'%B%F{red}YT:AcademicCrashout%f%b in %F{white}%~%f${vcs_info_msg_0_} %B%F{blue}>%f%b '

