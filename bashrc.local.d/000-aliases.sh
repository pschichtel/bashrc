alias sudo='sudo '
alias fuck='sudo $(history -p \!\!)'

LS_OPTIONS="--color=auto"
alias "ls=ls $LS_OPTIONS"
alias "ll=ls $LS_OPTIONS -l"
alias "l=ls $LS_OPTIONS -lA"

GREP_OPTIONS="--color=auto"
alias "grep=grep $GREP_OPTIONS"

export EDITOR=/usr/bin/vim

ncs() {
    local host="${1?param missing - host}"
    local port="${2?param missing - port}"
    openssl s_client -servername "$host" -connect "$host:$port"
}

