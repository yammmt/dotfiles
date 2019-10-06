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

alias firefox="open -a Firefox"

alias g="git"
alias ga="git add"
alias gap="git add -p"
alias gcm="git commit"
alias gco="git checkout"
alias gd="git diff"
alias gl="git log"
alias gol="git log --oneline"
alias gpp="git pull --prune"
alias gpu="git push"
alias gpuf="git push -f"
alias gst="git status"

alias l="ls -alh"

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


export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
