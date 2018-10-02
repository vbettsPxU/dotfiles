if [ -n "$SSH_CLIENT" ]; then text=" ssh-session"
fi

#Set bash colour scheme to bold directories
export LSCOLORS="Hx"
alias ls="ls -G"

#git aliases
alias g='git'
alias gap='git add -p'
alias gcl='git clone --recursive'
alias gr='git remote'
alias gf='git fetch'
alias gm='git merge --ff-only'
alias gps='git push'
alias gpu='git push -u'
alias gc='git commit'
alias gdc='git diff --cached'
alias gmv='git mv'
alias grb='git rebase'
alias gb='git branch'
alias grm='git rm'
alias gcp='git cherry-pick'
alias gcm='git checkout master'
alias tmux='tmux -u'

#Shortcut to reload .bash_profile
alias br=". ~/.bash_profile"

#Get to work!
alias werk="cd ~/Shopify-Repos"

#Add a cute star when commands succeed, and a frown when they fail
prompt_icon() {
  exit_code=$?
  #If previous command failed, show angry emoji. Otherwise, star emoji.
  if [ $exit_code -eq 0 ]; then
    printf $'\xE2\xAD\x90';
  else
    printf $'\xF0\x9F\x98\xA1';
  fi
}

export PS1=$'\[\e[1;35m\]\u@\h:\w${text}$(prompt_icon) \[\e[m\] '


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

bump() { git commit -m "Bump to $1" -m "[branch $2]" && git tag -a $1 -m "Bump version $1" && echo Bumped; }
