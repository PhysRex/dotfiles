echo "loading.bashrc"

# Load .bash_profile if NOT in a TMUX multiplexer
if [[ -z "$TMUX" ]]; then
echo "   > -- :: try loading .bash_profile"
    if [ -f "$HOME/.bash_profile" ]; then
    . "$HOME/.bash_profile"
    fi
fi

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# append to the history file, don't overwrite it
shopt -s histappend

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# HISTCONTROL=ignoreboth
# export HISTCONTROL=erasedups # History: don't store duplicates
export HISTSIZE=10000 # History: 10,000 entries

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
echo "   > -- :: try loading .bash_aliases"
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



#####################################################################
# RV MacOS .profile [now modified]
#source /usr/share/www/intranet.directstartv.com/scripts/srcsync-dir/helper.sh
export CLICOLOR=1  # same as 'alias ls=ls -G' which I also have set
#export LSCOLORS=exfxcxdxbxegedabagacad

export LSCOLORS=gxfxcxdxbxegedabagacad

# Enable color in grep
# export GREP_OPTIONS='--color=auto' # depracated option
alias grep='grep --color=auto'
export GREP_COLOR='3;33'

# COLOR STRINGS
           RED="\[\033[0;31m\]"
        ORANGE="\[\033[0;33m\]"
        YELLOW="\[\033[0;93m\]"
         GREEN="\[\033[0;32m\]"
          BLUE="\[\033[0;34m\]"
        PURPLE="\[\033[0;35m\]"
          CYAN="\[\033[0;36m\]"
   PALE_PURPLE="\[\033[1;95m\]"
  LIGHT_PURPLE="\[\033[1;35m\]"
     LIGHT_RED="\[\033[1;31m\]"
   LIGHT_GREEN="\[\033[1;32m\]"
         WHITE="\[\033[1;37m\]"
    LIGHT_GRAY="\[\033[0;37m\]"
    COLOR_NONE="\[\e[0m\]"

		BOLD_CYAN="\[\033[1;36m\]"
		DARK_GRAY="\[\033[1;90m\]"
		BLACK="\[\033[1;30m\]"


function gitprompt () {
	local gitbranch=$(git branch 2>&1 | grep '\*' | sed -e 's/\* //g')
	if [[ "$gitbranch" != "" ]]; then
      PS1="${GREEN}\h${BOLD_CYAN} [\u] ${CYAN}\w${RED} (${gitbranch}) ${PURPLE}\n◆ ${LIGHT_GRAY}$ "
    else
      PS1="${GREEN}\h${BOLD_CYAN} [\u] ${CYAN}\w${RED} ${PURPLE}\n◆ ${LIGHT_GRAY}$ "
    fi
}
PROMPT_COMMAND=gitprompt


# SSH_KNOWN_HOSTS=( $(cat ~/.ssh/known_hosts | \
#   cut -f 1 -d ' ' | \
#   sed -e s/,.*//g | \
#   uniq | \
#   egrep -v [0123456789]) )
# SSH_CONFIG_HOSTS=( $(cat ~/.ssh/config | grep "Host " | grep -v "*" | cut -f 2 -d ' ') )

complete -o default -W "${SSH_KNOWN_HOSTS[*]} ${SSH_CONFIG_HOSTS[*]}" ssh

WHOAMI=$(whoami)
export PATH=/usr/share/www/intranet.directstartv.com/scripts/srcsync-dir:/usr/local/bin:/usr/share/www/devops/scripts:$PATH
export PATH=/home/mauricio/.local/lib/python3.8:/home/mauricio/.local/bin:$PATH
export NODE_PATH="/usr/local/bin/node:/usr/local/lib/node_modules:{$WHOAMI}/lib/node_modules"
export NODE_ENV=development

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
