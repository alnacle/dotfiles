# Alvaro Navarro <alnacle@gmail.com>

export LSCOLORS='exfxcxdxbxegedabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
export WORDCHARS='*?_[]~=&;!#$%^(){}'
export FZF_DEFAULT_OPTS='--reverse --color="info:#000000,spinner:#000000" --prompt="  "'
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=$HISTSIZE
export EDITOR='nvim'
export VISUAL=$EDITOR
export PAGER='less'
export GIT_PAGER='less -F -X'
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[00;47;30m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export GREP_COLORS=auto
export GREP_COLOR=auto

export PATH=$HOME/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/bin
export PATH=$PATH:/sbin
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH

setopt no_beep
setopt interactive_comments
setopt prompt_subst

setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus
setopt pushd_silent

setopt append_history
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history

setopt hup
setopt long_list_jobs
setopt notify

autoload -U compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ''

# case-insensitive, partial-word, and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

bindkey -e

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^b' backward-char
bindkey '^f' forward-char
bindkey '\eb' backward-word
bindkey '\ef' forward-word
bindkey '\ed' kill-word
bindkey '^k' kill-line
bindkey '^d' delete-char
bindkey '\ew' backward-kill-word
bindkey '^u' backward-kill-line
bindkey '^r' history-incremental-search-backward

autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^p' up-line-or-beginning-search

autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search
bindkey '^n' down-line-or-beginning-search

zmodload zsh/complist
bindkey -M menuselect '^e' accept-line
bindkey -M menuselect '\ef' menu-complete
bindkey -M menuselect '\eb' reverse-menu-complete
bindkey -M menuselect '^[[Z' reverse-menu-complete

zle -N insert-last-command-output
bindkey '^x^l' insert-last-command-output

autoload -U copy-earlier-word
zle -N copy-earlier-word
bindkey '^[m' copy-earlier-word

zle -N expand-or-complete-with-waiting-dots
bindkey '^i' expand-or-complete-with-waiting-dots

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

zle -N fancy-ctrl-z;
bindkey '^z' fancy-ctrl-z

zle -N exit-shell
bindkey '^Sx' exit-shell

bindkey -N paste
zle -N start-paste
bindkey '^[[200~' start-paste
zle -N end-paste
bindkey -M paste '^[[201~' end-paste
zle -N paste-insert paste-insert
bindkey -R -M paste "^@"-"\M-^?" paste-insert
bindkey -M paste -s '^M' '^J'


git-prompt-info() {
  git rev-parse --is-inside-work-tree &>/dev/null || return
  echo " %F{green}($(current-git-branch)%f $(git-dirty)%F{green})%f "
}

current-git-branch() {
  git symbolic-ref --short -q HEAD
}

git-dirty() {
  test -z "$(command git status --porcelain --ignore-submodules -unormal)"
  if [[ $? -eq 1 ]]; then
    echo '%F{red}✗%f'
  else
    echo '%F{green}✔%f'
  fi
}

current_dir_path() {
   CURRENT=$(print -P %3~)
   echo "${CURRENT}"
}


expand-or-complete-with-waiting-dots() {
  echo -n "\e[31m......\e[0m"
  zle expand-or-complete
  zle redisplay
}

insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}

fancy-ctrl-z() {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

exit-shell() {
  exit
}

start-paste() {
  bindkey -A paste main
}

end-paste() {
  bindkey -e
  LBUFFER+=$_paste_content
  unset _paste_content
}

paste-insert() {
  _paste_content+=$KEYS
}

function path(){
    echo -e ${PATH//:/\\n}
}

# common aliases

alias ls='ls -G'
alias ll='ls -hlG'
alias la='ll -A'
alias vi='nvim'
alias vim='nvim'
alias v='nvim'
alias ..='cd ..'
alias df='df -h'
alias tmux='TERM=xterm-256color \tmux'
alias ducks='du -cksh * | sort -rn|head -11'

autoload -U colors && colors

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git-prompt-info)'

# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

if [[ -z "$LC_ALL" ]]; then
  export LC_ALL='en_US.UTF-8'
fi

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  $path
)

OSTYPE=$(uname -s)

if [[ $OSTYPE == "Darwin" ]]; then
    export HOMEBREW_CASK_OPTS="--appdir=~/Applications"
    export HOMEBREW_NO_ANALYTICS=1
    export HOMEBREW_NO_AUTO_UPDATE=1
fi

if [[ $OSTYPE == "Linux" ]]; then
    export JAVA_HOME=/opt/java
    export PATH=$JAVA_HOME/bin:$PATH
fi

if [[ $OSTYPE == "OpenBSD" ]]; then
    export CVSROOT=anoncvs@anoncvs.usa.openbsd.org:/cvs
    export PKG_PATH=http://ftp.spline.de/pub/OpenBSD/snapshots/packages/$(machine -a)/
fi

# source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Rust
export PATH=${HOME}/.cargo/bin:$PATH

# ruby
export GEM_HOME=${HOME}/.gem
export PATH=${GEM_HOME}/bin:${PATH}

# Plan9port
export PLAN9=${HOME}/src/github.com/9fans/plan9port
export PATH=${PATH}:${PLAN9}/bin

# Python, Go, Node
export PATH=$HOME/.pyenv/bin:$PATH
export PATH=$HOME/.goenv/bin:$PATH
export PATH=$HOME/.nodenv/bin:$PATH

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(goenv init -)"
eval "$(nodenv init -)"

export PATH="${GOROOT}/bin:$PATH"
export PATH="${GOPATH}/bin:$PATH"

# Local private stuff
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
