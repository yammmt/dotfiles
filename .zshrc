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

#### Ruby

alias bx="bundle exec"
alias bxr="bundle exec ruby"
alias br="bin/rails"
alias brc="bin/rails c"
alias brs="bin/rails s"
alias brt="bin/rails t"

#### Rust

alias c="cargo"
alias cb="cargo b"
alias cbr="cargo b --release"
alias cac="cargo c"
alias catn="cargo atcoder new"
alias cats="cargo atcoder submit"
alias catt="cargo atcoder test"
alias ccl="cargo clippy"
alias cclt="cargo clippy --tests"
alias cf="cargo fmt"
alias cfc="cargo fmt -- --check"
alias cchk="cargo check"
alias cr="cargo r"
alias crr="cargo r --release"
alias ct="cargo t"
alias ctr="cargo t --release"

#### Git

alias g="git"
alias ga="git add"
alias gap="git add -p"
alias gb="git branch"
alias gcm="git commit"
alias gcman="git commit --amend --no-edit"
alias gcmm="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -"
alias gcp="git cherry-pick"
alias gcpc="git cherry-pick --continue"
alias gd="git diff"
alias gdc="git diff --cached"
alias gds="git diff --staged"
alias gdt="git difftool"
alias gf="git fetch"
alias gfp="git fetch --prune"
alias gg="git log --graph --oneline"
alias ggo="git log --graph --oneline"
alias ggr="git log --graph --decorate"
alias ggrep="git grep -n"
alias ggrp="git log --graph --decorate --pretty=fuller"
alias gl="git log"
alias glast="git log -1 --oneline"
alias glp="git log --pretty=fuller"
alias gm="git merge"
alias gma="git merge --abort"
alias gn="git notes"
alias gna="git notes add"
alias gne="git notes edit"
alias gol="git log --oneline"
alias gol1="git log --oneline -10"
alias gol3="git log --oneline -3"
alias gol4="git log --oneline -4"
alias gol5="git log --oneline -5"
alias gol7="git log --oneline -7"
alias golg="git log --oneline --graph"
alias gpp="git pull --prune"
alias gpu="git push"
alias gpuf="git push --force-with-lease --force-if-includes"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbi="git rebase -i"
alias grflg="git reflog"
alias grflg1="git reflog -10"
alias grestore="git restore"
alias grst="git reset"
alias grstr="git restore"
alias gsb="git show-branch"
alias gsh="git show --notes"
alias gshst="git show --stat"
alias gshow="git show --notes"
alias gst="git status"
alias gstash="git stash"
alias gstasha="git stash apply"
alias gstashl="git stash list"
alias gstashm="git stash -m"
alias gstashp="git stash pop"
alias gstashsh="git stash show"
alias gstashshp="git stash show -p"
alias gsw="git switch"
alias gswb="git switch -"
alias gt="git tag"
alias gtl="git tag --list"

#### Others

alias cda="cd ~/git/atcoder/v1.70.0/"
alias firefox="open -a Firefox"
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

# https://github.com/pyenv/pyenv/issues/1740#issuecomment-738749988
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
# eval "$(pyenv virtualenv-init -)"

# hide because I can't compile c++ but I'm not sure
# export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
# export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

export RUST_BACKTRACE=1

# without this, `clang` command uses Mac version and invites error...
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
