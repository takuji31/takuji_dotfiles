# vim:ft=zsh:

# common
export LANG="ja_JP.UTF-8"
export LANGUAGE="ja_JP.utf8:ja_JP.UTF-8:en_US:en_GB:en"


if test -e /opt/local
then
    SYSTEM_PREFIX=/opt/local
else
    SYSTEM_PREFIX=/usr
fi

export MYSQL_PS1='\u@\h:\d>\_'

export EDITOR=vim
export PAGER="$SYSTEM_PREFIX/bin/lv -c"
export EMAIL=takuji@senchan.jp
export MYCHANGELOG_MEMO=$HOME/ChangeLog

export CLICOLOR=\1

OPT_PATH=$HOME/bin:/opt/local/bin:/usr/local/bin
PATH=${PATH/$OPT_PATH/}
export PATH=$OPT_PATH:$PATH
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export MANPATH=$MANPATH:$SYSTEM_PREFIX/man
# 1セクションが3とかより優先されるとウザいのです
export MANSECT=3:2:1:1p:3p:8:2:4:5:6:7:9:0p:tcl:n:l:p:o

# zsh
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

# prompt
#export PROMPT="%n%# "
#[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
#  export PROMPT="%{[37m%}%n@${HOST%%.*}%# "
#
export PYTHONSTARTUP=$HOME/.pythonrc.py
