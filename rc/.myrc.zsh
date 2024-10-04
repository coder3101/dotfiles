# This allows me to delete the branches which have been deleted in the upstream
function gsyn() {
    git fetch --prune
    git branch -vv | awk '/: gone]/{print $1}' | xargs -r git branch -d
}

# Shows git log in a cwd from given commit sha
function glog() {
    git log --oneline $1..HEAD -- .
}

# Same as glog but for diff
function gdiff() {
    git diff $1..HEAD -- .
}

# This allows me to add hunks interactively
alias gadd="git add -i -p"

# Alacritty magic to make it in ssh
alias ssh="TERM=xterm-256color $(which ssh)"

# Sometimes, nvid is good for show-offs
alias nvid="neovide --maximized --title-hidden --fork"
