__build_ps1() {
    local exit_status="$?"

    local black='\[\033[00;30m\]'
    local blue='\[\033[00;34m\]'
    local green='\[\033[00;32m\]'
    local cyan='\[\033[00;36m\]'
    local red='\[\033[00;31m\]'
    local purple='\[\033[00;35m\]'
    local brown='\[\033[00;33m\]'
    local lgray='\[\033[00;37m\]'
    local dgray='\[\033[01;30m\]'
    local lblue='\[\033[01;34m\]'
    local lgreen='\[\033[01;32m\]'
    local lcyan='\[\033[01;36m\]'
    local lred='\[\033[01;31m\]'
    local lpurple='\[\033[01;35m\]'
    local yellow='\[\033[01;33m\]'
    local white='\[\033[01;37m\]'
    local reset='\[\033[00;00m\]'
    
    if [ "$exit_status" = '0' ]; then
        local result="${dgray}$exit_status"
    else
        local result="${lred}$exit_status"
    fi

    local path="${cyan}\$(sed 's:/:${dgray}/${cyan}:g' <<< \"\w\" | sed 's/^~/${lgreen}~/g')"

    if [ "$UID" = '0' ]
    then
        local user="${red}"'\u'
    else
        local user="${lgreen}"'\u'
    fi
    local separator="${yellow}@"
    local host="${lcyan}"'\h'
    local suffix="${green}"'$'"${reset} "
    
    PS1=" ${result} ${user}${separator}${host} ${path} ${suffix}"
}

PROMPT_COMMAND="__build_ps1"

