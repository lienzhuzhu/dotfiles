alias vim='nvim'
alias python='python3'

gstat() {
    git status 
}

# alias: git commit -am "<commit message>; git push"
gc() {
    if [ $# -eq 0 ]; then
        echo "Error: Commit message is required."
        return 1
    fi
    git commit -am "$@"
    git push
}


#alias: git add -A && git commit -m "<commit message>; git push"
ga() {
    if [ $# -eq 0 ]; then
        echo "Error: Commit message is required."
        return 1
    fi
    git add -A && git commit -m "$@"
    git push
}
