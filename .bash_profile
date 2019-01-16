if [ -n "$SSH_CLIENT" ]; then text=" ssh-session"
fi

#Set bash colour scheme to bold directories
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad


#aliases
alias tmux='tmux -u'
alias ls="ls -A"
#Shortcut to reload .bash_profile
alias br=". ~/.bash_profile"
#Deploy and publish themes
alias deploy="npm run deploy --publish"
alias watch="npm run watch --skip-deploy --skip-build --publish"
#Get to work!
alias werk="cd ~/Shopify-Repos"
#Show entire filepath
alias sp="echo $PWD"
#Git commands
alias gb="git branch"
alias gcm="git commit -m"
alias gs="git status"
alias gdb="git branch --merged | egrep -v \"(^\*|master)\" | xargs git branch -d"

#Add a cute mushroom when commands succeed, and a thumbs down when they fail
prompt_icon() {
  exit_code=$?
  #If previous command failed, show thumbs down. Otherwise, mushroom.
  if [ $exit_code -eq 0 ]; then
    printf $'\xF0\x9F\x8D\x84';
  else
    printf $'\xF0\x9F\x91\x8E';
  fi
}

export PS1=$'\[\e[1;35m\]\u@\h:\W${text} $(prompt_icon) \[\e[m\] '

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

bump() { git commit -m "Bump to $1" -m "[branch $2]" && git tag -a $1 -m "Bump version $1" && echo Bumped; }

copyEnv() { find . -type d -path "./*-shopify" ! -path "./rimg-shopify" -prune -exec bash -c 'cp ".env" "${1}/" && echo Copied to $1' -- {} \;; }

export -f copyEnv
