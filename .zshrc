# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

# Call local setup script if exist
if [[ -r ~/.zshrc_local ]] then
  . ~/.zshrc_local
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

unsetopt correct_all
# History
setopt EXTENDED_HISTORY # add timestamps to history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt APPEND_HISTORY # adds history
setopt HIST_REDUCE_BLANKS

alias vimconf='vim ~/.vimrc'
alias zshconf='vim ~/.zshrc'
alias zshlconf='vim ~/.zshrc_local'

# A little bit of git stuff, without using the whole git plugin
alias g='git'
alias ga='git add'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gco='git checkout'
alias gc='git commit -v'
alias gp='git pull'
alias gpom='git push origin master'
alias gpoh='git push origin HEAD'
alias gh='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
alias grh='git reset head'

# Update dotfiles in the bg on load
#pushd .
#cd ~/dotfiles
#git pull &
#popd

# Maven
alias mvnall='mvn clean package findbugs:check'
alias mvnnotest='mvn -DskipTests clean package'

# Vagrant
alias vssh='ssh www.yammer.dev'
alias vup='vagrant up'
alias vhalt='vagrant halt'
alias vreload='vagrant reload'

alias hg='history | grep'
alias metrics='curl -s localhost:8081/metrics\?pretty=true | vim - -s ~/.vim/snippets/setjson.script -R'
