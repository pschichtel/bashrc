# History settings
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTIGNORE='reboot:poweroff'
shopt -s histappend

if [ "$(basename "$SHELL" 2>/dev/null)" = 'bash' ]
then
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # If set, the pattern "**" used in a pathname expansion context will
    # match all files and zero or more directories and subdirectories.
    shopt -s globstar
fi

# Enable proper long input line wrapping
set horizontal-scroll-mode on

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

