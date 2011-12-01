# vim: ft=zsh:
alias spec='spec -c -Du -fs'

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

alias la="ls -la"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias s=screen
alias tt="tmux -2 new-session"
alias tr="tmux attach-session"
alias tv="tmux new-window vim "

alias vi="vim"
alias q="exit"
alias sudo="sudo "
alias zmv='noglob zmv -W'
alias v='DIR=`pwd`;screen vim ../`basename $DIR`'
