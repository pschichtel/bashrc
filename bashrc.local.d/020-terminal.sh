# readline
export INPUTRC=/etc/inputrc.local

# History settings
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTIGNORE='reboot:poweroff:exit:logout:clear'
shopt -s histappend

# update the values of LINES and COLUMNS.
[[ $DISPLAY ]] && shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Enable proper long input line wrapping
set horizontal-scroll-mode on

# make less more friendly for non-text input files, see lesspipe(1)
if [ -x /usr/bin/lesspipe ]
then
    eval "$(SHELL=/bin/sh lesspipe)"
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]
then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

if tty | grep -q tty
then
    export TMOUT=300
fi

