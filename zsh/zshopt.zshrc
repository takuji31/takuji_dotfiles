# vim:ft=zsh:
bindkey -e
setopt extended_history
setopt extended_glob
setopt share_history
setopt mark_dirs
setopt auto_pushd
setopt pushd_ignore_dups
setopt list_packed
setopt prompt_subst
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_save_nodups
setopt auto_cd
setopt correct
setopt noautoremoveslash
setopt nolistbeep
setopt complete_aliases
setopt auto_menu
setopt list_types

autoload -U colors
colors
autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:default' menu select=1
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# HOST名の補完
_cache_hosts=(`perl -ne  'if (/^([\w.-]+)/) {print "$1\n"}' ~/.ssh/known_hosts`)



RPROMPT="%{${fg[red]}%}[ %~ ]%{${reset_color}%} "
case ${UID} in
0)
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[red]}%}%/#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%r じゃね? [n,y,a,e]:%{${reset_color}%}%b "
    ;;
*)
    PROMPT="%{${fg[red]}%}%n@%m%%%{${reset_color}%} "
    PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[red]}%}%r じゃね? [n,y,a,e]:%{${reset_color}%} "
    ;;
esac

bindkey -e
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

bindkey "\e[Z" reverse-menu-complete
