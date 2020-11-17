#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

### Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

### alias
alias bx="bundle exec"
alias bxr="bundle exec rails"
alias br="bin/rails"
alias brs="bin/rails s"

alias c="cargo"
alias cb="cargo b"
alias cac="cargo c"
alias cat="cargo atcoder"
alias cr="cargo r"
alias ct="cargo t"

alias firefox="open -a Firefox"

alias g="git"
alias ga="git add"
alias gap="git add -p"
alias gb="git branch"
alias gcm="git commit"
alias gco="git checkout"
alias gcp="git cherry-pick"
alias gd="git diff"
alias gf="git fetch"
alias ggr="git log --graph --decorate"
alias ggrep="git grep -n"
alias ggrp="git log --graph --decorate --pretty=fuller"
alias gl="git log"
alias gm="git merge"
alias gol="git log --oneline"
alias gpp="git pull --prune"
alias gpu="git push"
alias gpuf="git push --force-with-lease"
alias grb="git rebase"
alias grestore="git restore"
alias grst="git reset"
alias gshow="git show"
alias gst="git status"
alias gstash="git stash"
alias gsw="git switch"

# alias l="ls -alh"
# alias l="exa -alFh"
alias l="lsd -alF"
alias ls="lsd"

alias pm="python manage.py"

### peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

### hyper-tab-icons
precmd() {
   pwd=$(pwd)
   cwd=${pwd##*/}
   print -Pn "\e]0;$cwd\a"
}

preexec() {
   printf "\033]0;%s\a" "${1%% *} | $cwd"
}

### other envs
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export RUST_BACKTRACE=1
