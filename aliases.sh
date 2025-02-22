alias ..="cd .."

alias ls='ls -alhG'
alias dotfiles="cd ~/code/private/dotfiles"
alias arh="cd ~/code/arh"
alias private="cd ~/code/private"
alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

# GIT
alias g="git"
alias gpl="git pl"
alias gps="git push"
alias gst="git st"

# AWS & EKS
source ~/code/private/dotfiles/aws-switch-to.sh
alias staging="aws_switch_to staging"
alias production="aws_switch_to production"
alias services="aws_switch_to services"
alias kaeuferportal="aws_switch_to kaeuferportal"
alias development="aws_switch_to development"
alias data="aws_switch_to data"

update_ruby(){
  local version=$1

  echo $version >.ruby-version
  sed -i -E "s/FROM ruby:[a-z0-9.-]{2,}/FROM ruby:$version/" Dockerfile
  sed -i -E "s/ruby [a-z0-9.-]{2,}/ruby $version/" Gemfile.lock
  docker-compose build
}

