# paths
export GOPATH=$HOME/go/
export JAVA_HOME=/opt/jdk/
export PATH=$PATH:$GOPATH/bin/
export PATH=$PATH:$JAVA_HOME/bin/
export PATH=$PATH:~/android-studio/bin/
export PATH=$PATH:~/Android/Sdk/tools/
export PATH=$PATH:~/Android/Sdk/platform-tools/
export PATH=$PATH:~/.cargo/bin

# history
PROMPT_COMMAND='history -a'
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=-1 HISTFILESIZE=-1
HISTIGNORE='fg'

# tty
stty -ctlecho

# colors
if [ "$TERM" != dumb ]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'

    C() { echo -n "\[\e[${2}m\]$1\[\e[0m\]"; }
    PS1="\
$(C '┌─' '1;30')\
$(C '>' '$([ "$?" = 0 ] && echo "1;32" || echo "1;31")')\
$(C '$(jobs | while read; do echo -n \>; done)' '1;34')\
 \
$(C '\h' '1;36')\
 \
$(C '\w' '1;33')\
$(C '$(__git_ps1)' '0;32')\
\n\
$(C '└' '1;30')\
$(C '\$' '35')\
 \
"
    unset C
else
    PS1='\w\n\$ '
fi

# completions
source /etc/bash_completion

# aliases
alias mydu='du -s * .[^.]* | sort -n'
alias e='emacs -nw'
alias l='ls -lArt'
alias p='python'
alias noise='aplay -f dat /dev/urandom &>/dev/null'
alias gdb='gdb -q'
alias dmesg='dmesg -w'

# helpers
hack() {
    local path=$(mktemp -dp ~/tmp "hack-${1:-this}.XXX")
    cd $path
    vim .
}

up() {
    sudo apt-get update        &&\
    sudo apt-get upgrade -y    &&\
    sudo apt-get autoremove -y &&\
    sudo apt-get autoclean     &&\
    sudo apt-get clean         &&\
    sudo updatedb              &&\
    true
}
