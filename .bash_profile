if [ -n "$SSH_CLIENT" ]; then text=" ssh-session"
fi

export BASH_SILENCE_DEPRECATION_WARNING=1

#Set bash colour scheme to bold directories
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad


#aliases
alias tmux='tmux -u'
alias ls="ls -A"
#Shortcut to reload .bash_profile
alias br=". ~/.bash_profile"
#Deploy and publish themes
alias deploy="npm run deploy -- --publish"
alias watch="npm run watch -- --skip-deploy --skip-build"
alias pw="npm run watch -- --publish --skip-deploy --skip-build"
alias bdpw="npm run watch -- --publish"
#Get to work!
alias werk="cd ~/Shopify-Repos"
#Show entire filepath
alias sp="echo $PWD"
#Git commands
alias gb="git branch"
alias gco="git checkout"
alias gcm="git commit -m"
alias gs="git status"
alias gdb="git branch | grep -v master | grep -v develop | xargs git branch -d"
alias atlantic="cd ~/Shopify-Repos/themes/atlantic-shopify"
alias editions="cd ~/Shopify-Repos/themes/editions-shopify"
alias empire="cd ~/Shopify-Repos/themes/empire-shopify"
alias grid="cd ~/Shopify-Repos/themes/grid-shopify"
alias handy="cd ~/Shopify-Repos/themes/handy-shopify"
alias launch="cd ~/Shopify-Repos/themes/launch-shopify"
alias pacific="cd ~/Shopify-Repos/themes/pacific-shopify"
alias reach="cd ~/Shopify-Repos/themes/reach-shopify"
alias startup="cd ~/Shopify-Repos/themes/startup-shopify"
alias superstore="cd ~/Shopify-Repos/themes/superstore-shopify"
alias vogue="cd ~/Shopify-Repos/themes/vogue-shopify"
alias mobilia="cd ~/Shopify-Repos/themes/OOTS/mobilia"
alias parallax="cd ~/Shopify-Repos/themes/OOTS/parallax"
alias retina="cd ~/Shopify-Repos/themes/OOTS/retina"
alias responsive="cd ~/Shopify-Repos/themes/OOTS/responsive"
alias turbo="cd ~/Shopify-Repos/themes/OOTS/turbo"
alias flex="cd ~/Shopify-Repos/themes/OOTS/flex"
alias artisan="cd ~/Shopify-Repos/themes/OOTS/artisan"

alias themes="cd ~/Shopify-Repos/themes"
alias libraries="cd ~/Shopify-Repos/libraries"
alias use="npm run paskit store:use"
alias add="npm run paskit store:add"

alias liquidlint="npm run paskit lint -- --linter=liquid > liquidlint.ignore.txt"

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
export GITHUB_TOKEN=####
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
export PATH="$PATH:$GOPATH/bin"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

bump() { git commit -m "Bump to $1" -m "[branch $2]" && git tag -a $1 -m "Bump version $1" && echo Bumped; }

copyEnv() { find . -type d -path "./*-shopify" ! -path "./rimg-shopify" -prune -exec bash -c 'cp ".env" "${1}/" && echo Copied to $1' -- {} \;; }

export -f copyEnv

find_replace() {
  # grep -rl "$1" * | grep liquid
  grep -rl "$1" * | xargs sed -i "" "s/$1/$2/g"
  echo "Converted the following instances of $1 to $2: "
  grep -rn "$2" *
}

. /usr/local/opt/asdf/asdf.sh

. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
