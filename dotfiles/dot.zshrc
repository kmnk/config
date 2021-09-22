# 環境変数
PATH=$HOME/local/bin:/usr/local/bin:$PATH

GOPATH=$HOME/local/go
PATH=$GOPATH/bin:$PATH
XDG_CONFIG_HOME=$HOME/.config

export PATH
export GOPATH
export XDG_CONFIG_HOME

# 初期設定
local RED=$'%{\e[1;31m%}'
local GREEN=$'%{\e[1;32m%}'
local YELLOW=$'%{\e[1;33m%}'
local BLUE=$'%{\e[1;34m%}'local PINK=$'%{\e[1;35m%}'
local SKYBLUE=$'%{\e[1;36m%}'
local WHITE=$'%{\e[1;37m%}'
local DEFAULT=$'%{\e[m%}'

# 文字コード指定
export LANG=ja_JP.UTF-8
#export LANG=en_US.UTF-8

case ${PWD} in
0)
    PROMPT="%B%$GREEN#$DEFAULT%b "
    RPROMPT="[%~]"
    PROMPT2="%B$GREEN%_#$DEFAULT%b "
    SPROMPT="%B$GREEN%r is correct? [n,y,a,e]:$DEFAULT%b "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&        PROMPT="$WHITE${HOST%%.*} ${PROMPT}"
    ;;
*)
    PROMPT="$GREEN%%$DEFAULT "
    RPROMPT="[%~]"
    PROMPT2="$GREEN%_%%$DEFAULT "
    SPROMPT="$GREEN%r is correct? [n,y,a,e]:$DEFAULT "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&        PROMPT="$WHITE${HOST%%.*} ${PROMPT}"
    ;;
esac

# 色指定
setopt prompt_subst
case "${TERM}" in
kterm*|xterm*|screen*|tmux*)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# エイリアス
setopt complete_aliases # aliased ls needs if

# vim！
alias -s txt=nvim
export SVN_EDITOR=nvim
export GIT_EDITOR=nvim

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history
setopt append_history

# 自動コマンド補完をいい感じにする
autoload -Uz compinit
zstyle ':completion:*:default' menu select=1 list-colors '' matcher-list 'm:{a-z}={A-Z}'
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# 履歴関連オプション
setopt auto_cd      # 自動cd
setopt auto_pushd   # ディレクトリ移動履歴
setopt list_packed  # 詰めて表示
setopt nolistbeep   # beep off

# tmux関連
alias tml="tmux ls"
alias tmt="tmux attach-session -t"
alias tmn="tmux new-session -s"

# cd関連
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

export DENO_INSTALL=$HOME/.deno
export PATH="$DENO_INSTALL/bin:$PATH"

source ~/.zshrc_profile

# vim: filetype=zsh
