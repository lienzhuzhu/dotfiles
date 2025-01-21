alias vim='nvim'
alias python='python3'
alias cat='bat'
alias soz="source ${ZDOTDIR}/.zshrc"

# git status
s() {
    git status 
}

# git commit -am "<commit message>; git push"
gc() {
    if [ $# -eq 0 ]; then
        echo "Error: Commit message is required."
        return 1
    fi
    git commit -am "$@"
}
gcp() {
    if [ $# -eq 0 ]; then
        echo "Error: Commit message is required."
        return 1
    fi
    git commit -am "$@"
    git push
}

# git add -A && git commit -m "<commit message>; git push"
ga() {
    if [ $# -eq 0 ]; then
        echo "Error: Commit message is required."
        return 1
    fi
    git add -A && git commit -m "$@"
}
gap() {
    if [ $# -eq 0 ]; then
        echo "Error: Commit message is required."
        return 1
    fi
    git add -A && git commit -m "$@"
    git push
}

gp() {
    git push
}

# git diff
gd() {
    git diff "$@"
}

# better ls
alias ls='ls -F'

# cd into braindump
bd() {
    cd ~/armory/braindump/
}

# cd into dotfiles
dots() {
    cd ~/dotfiles/config-mac/
}

# cd into blog
blog() {
    cd ~/armory/blog
}
