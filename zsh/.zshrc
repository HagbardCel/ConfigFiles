# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/fabian/.zshrc'

autoload -Uz compinit
compinit
autoload -U promptinit
promptinit
# End of lines added by compinstall
# Theme:
#ZSH_THEME="bullet-train"
# From my .bashrc
zstyle ':completion:*' menu select
setopt completealiases
setopt HIST_IGNORE_DUPS
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"    history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}"  history-beginning-search-forward

DIRSTACKFILE="$HOME/.zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >|$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus

autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
unalias run-help
alias help=run-help
alias dirs='dirs -v'
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U colors
colors
##PROMPT="%{$fg_no_bold[yellow]%}%1~%{$reset_color%}%{"$"%}"
PROMPT="[%1~%(1j. <%j>.)]% "$" "
#[[ $- != *i* ]] && return
#PROMPT="[%1~%{$reset_color%}%(1j. <%j>.)]%{"$" %}"
#[[ $- != *i* ]] && return

export COMPLETION_WAITING_DOTS=false
export TERM=screen-256color
export EDITOR=vim

alias ls='ls --color=auto'
alias ll='ls -l'
alias math='rlwrap math'
alias enfr='translate en fr'
alias fren='translate fr en'
alias defr='translate de fr'
alias frde='translate fr de'
alias deen='translate de en'
alias ende='translate en de'
alias top='htop'
alias vim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'  

export WINEARCH=win32
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

set convert-meta on

. /etc/profile.d/vte.sh
export PATH=$PATH:/usr/lib/surfraw

bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
#xmodmap ~/.Xmodmap
if [[ ! ($TERM=~screen-256color) ]]; then
    exec tmux
fi
#########################################
# Zsh highlighter
#########################################
#
# Enable highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Override highlighter colors
ZSH_HIGHLIGHT_STYLES[default]=none
#ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=009
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=214
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=009,standout
ZSH_HIGHLIGHT_STYLES[alias]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[builtin]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[function]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=white,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=none
ZSH_HIGHLIGHT_STYLES[hashed-command]=fg=009
ZSH_HIGHLIGHT_STYLES[path]=fg=214,underline
ZSH_HIGHLIGHT_STYLES[globbing]=fg=063
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=white,underline
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=063
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=009
ZSH_HIGHLIGHT_STYLES[assign]=none

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/fabian/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/fabian/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/fabian/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/fabian/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

