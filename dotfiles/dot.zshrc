# 環境変数
JAVA_HOME=/usr/java/jdk1.6.0_18
M2_HOME=$HOME/maven
M2=$M2_HOME/bin

PATH=$HOME/bin:$HOME/local/bin:$JAVA_HOME/bin:$M2:$PATH

export PATH JAVA_HOME M2_HOME M2

export LESS=mqeisz-2XR

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

# プロンプトの設定
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
case "${TERM}" in
kterm*|xterm*|screen*)
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
alias vi="vim"
alias ack="ack -C 5"
#alias ack=""

alias -s txt=vim

# vim！
bindkey -v
alias -s txt=vim
export SVN_EDITOR=vim

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# 自動コマンド補完をいい感じにする
autoload -U compinit
compinit
zstyle ':completion:*' list-colors ''
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

# screen関連
alias sc="screen"
alias scl="screen -ls"
alias sct="screen -r"
alias scn="screen -S"

# telnet
alias memd="telnet localhost 11211"

# ディレクトリ移動
alias gh="cd ~"
alias gw="cd ~/work"
alias gl="cd ~/log"
alias gsvn="cd ~/svn"
alias gw00="cd ~/svn/work_00"
alias gw01="cd ~/svn/work_01"
alias gw02="cd ~/svn/work_02"
alias gw03="cd ~/svn/work_03"
alias gw04="cd ~/svn/work_04"
alias gw05="cd ~/svn/work_05"
alias gw06="cd ~/svn/work_06"
alias gw07="cd ~/svn/work_07"
alias gw08="cd ~/svn/work_08"
alias gw09="cd ~/svn/work_09"
alias gw10="cd ~/svn/work_10"
alias gw11="cd ~/svn/work_11"
alias gw12="cd ~/svn/work_12"
alias gw13="cd ~/svn/work_13"

# vim: filetype=zsh
