# zshell config

[ -x "$(command -v nvim)" ] && alias {v,vi,vim}="nvim"

case `uname` in
  Darwin)
    export HOMEBREW_NO_ANALYTICS=1    # avoid analytics
    export HOMEBREW_NO_AUTO_UPDATE=1  # do not do brew update before install
    export HOMEBREW_NO_ENV_HINTS=1    # no more annoying messages
  ;;
  Linux)
    alias ls='ls --color=auto' 

    export JAVA_HOME=/opt/java
    export PATH=$JAVA_HOME/bin:$PATH
  ;;
  OpenBSD)
    export LSCOLORS=gxfxcxdxbxegedabagacad
    [ -x "$(command -v colorls)" ] && alias ls='colorls -G'
  ;;
esac

# alises
alias ..='cd ..'
alias vimdiff='nvim -d'
alias df='df -h'
alias tmux='TERM=xterm-256color \tmux'
alias duh='du -sh -h * .[^.]* 2> /dev/null | sort -h'
alias ll='ls -hal'

# exports
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"
export TERM="xterm-256color"

export PATH=$HOME/.local/bin
export PATH=$PATH:/bin:/sbin
export PATH=$PATH:/usr/bin:/usr/sbin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/opt/bin

export EDITOR="nvim"
export PAGER='less'
export GIT_PAGER='less -F -X'

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# history
setopt append_history          # append to history file
setopt extended_history        # record timestamp of command
setopt hist_expire_dups_first  # expire a duplicate event first when trimming history
setopt hist_find_no_dups       # don't display a previously found event
setopt hist_ignore_all_dups    # delete an old recorded event if a new event is a duplicate
setopt hist_ignore_dups        # don't record an event that was just recorded again
setopt hist_ignore_space       # ignore commands that start with space
setopt hist_verify             # show command with history expansion to user before running it
setopt hist_reduce_blanks      # remove extra blanks from each command added to the history
setopt hist_save_no_dups       # don't write a duplicate event to the history file
setopt inc_append_history      # add commands to HISTFILE in order of execution
unsetopt share_history         # no sharing history between sessions

# changing directories
setopt auto_cd                 # if a command isn't valid, but is a directory, cd to that dir
setopt auto_pushd              # push visited directories to the directory stack
setopt pushd_ignore_dups       # ignore duplicated pushed directories
setopt pushd_silent            # do not display pushed directories

# Expansion and globbing
setopt glob_dots               # do not require a leading '.' in a filename to be matched
setopt extended_glob           # use more awesome globbing features

# completions
setopt auto_menu               # show completion menu on successive tab press
setopt auto_list               # automatically list choices on ambiguous completion
setopt always_to_end           # move cursor to the end of a completed word
setopt auto_param_slash        # if completed parameter is a directory, add a trailing slash
setopt complete_in_word        # complete from both ends of a word
unsetopt menu_complete         # do not autoselect the first completion entry

# input/output
setopt interactive_comments    # allow comments in commands
unsetopt correct               # don't try to correct the spelling of commands
unsetopt correct_all           # don't try to correct the spelling of all arguments in a line
unsetopt flow_control          # disable start/stop characters in shell editor
unsetopt rm_star_silent        # ask for confirmation for `rm *' or `rm path/*'

# job control
setopt auto_resume             # attempt to resume existing job before creating a new process
setopt notify                  # report status of background jobs immediately
setopt long_list_jobs          # list jobs in the long format by default

# prompting
setopt prompt_subst            # allows dynamic information in the prompt 

# zle
setopt no_beep                 # remove prompt beep sound


autoload -U colors && colors
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

local ret_status="%(?:%{$fg_bold[green]%}$:%{$fg_bold[green]%}$)"
local git_prefix="%{$fg_bold[blue]%}%{$fg[red]%}"
local git_suffix="%{$reset_color%} "

PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} ${git_prefix}$(parse_git_branch)${git_suffix}'

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/(\1)/p'
}

zmodload -i zsh/complist

# autocompletion with an arrow-key driven interface
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

zstyle '*' single-ignored show

# Automatically update PATH entries
zstyle ':completion:*' rehash true

# Keep directories and files separated
zstyle ':completion:*' list-dirs-first true

# Use emacs-like key bindings by default:
bindkey -e

# [Ctrl-r] - Search backward incrementally for a specified string. The string
# may begin with ^ to anchor the search to the beginning of the line.
bindkey '^r' history-incremental-search-backward      

# automatically remove duplicates from these arrays
typeset -U path PATH cdpath CDPATH fpath FPATH manpath MANPATH

# Local private stuff
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
