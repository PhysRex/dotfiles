echo "  > loaded .profile"

#source /usr/share/www/intranet.directstartv.com/scripts/srcsync-dir/helper.sh
export CLICOLOR=1  # same as 'alias ls=ls -G' which I also have set
#export LSCOLORS=exfxcxdxbxegedabagacad

export LSCOLORS=gxfxcxdxbxegedabagacad

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# History: don't store duplicates
export HISTCONTROL=erasedups
# History: 10,000 entries
export HISTSIZE=10000

alias phpx='XDEBUG_CONFIG="profiler_enable=1" php'
alias locate="mdfind -name $1"
alias deploy="/usr/share/www/intranet.directstartv.com/scripts/srcsync-dir/deploy"
alias rvdiffr='/usr/share/www/intranet.directstartv.com/scripts/srcsync-dir/rvdiffr'
alias zr='sudo /usr/local/zend/bin/zendctl.sh restart-apache'
alias rvrepo='php /usr/share/www/intranet.directstartv.com/scripts/srcsync-dir/repo_sync.php'
alias repo_sync='php /usr/share/www/intranet.directstartv.com/scripts/srcsync-dir/repo_sync.php'
alias gf='git-flow'
alias redis-start='sudo launchctl start io.redis.redis-server'
alias redis-stop='sudo launchctl stop io.redis.redis-server'
#alias py=python3
#alias pip=pip3
alias ls='ls -F'

# general shortcuts
# alias c='cd '
alias mv='mv -i'
alias rm='rm -i'

# Need to do this so you use backspace in screen...I have no idea why
alias screen='TERM=screen screen'

# listing files
alias l='ls -al'
alias ltr='ls -ltr'
alias lth='l -t|head'
alias lh='ls -Shl | less'
alias tf='tail -f -n 100'

# editing shortcuts
alias m='mate'
alias v='vim'
alias sublime='open -a "/Applications/Sublime Text 2.app"'

# grep for a process
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}

# Thanks to Geoffrey's peepcode for many of these
alias g='git '
alias gst='git status'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gdh='git diff HEAD'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gcap='git commit -v -a && git push'
alias gpp='git pull; git push'

# For when you are stuck between worlds...
alias gsd='git svn dcommit'
alias gsr='git svn rebase'


# top level folder shortcuts
alias www='cd /usr/share/www'
alias www:bi='cd /usr/share/www/base_includes'
alias www:int='cd /usr/share/www/intranet.directstartv.com'
alias www:h='cd /usr/share/www/hailo'

alias "h?"="history | grep "

# display battery info on your Mac
# see http://blog.justingreer.com/post/45839440/a-tale-of-two-batteries
alias battery='ioreg -w0 -l | grep Capacity | cut -d " " -f 17-50'


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
setopt PROMPT_SUBST
# PROMPT_COMMAND=gitprompt
# PROMPT='${gitprompt}'

# 'ZSH_VERSION' only defined in Zsh
# 'precmd' is a special function name known to Zsh
[ ${ZSH_VERSION} ] && precmd() { myprompt; }

# 'BASH_VERSION' only defined in Bash
# 'PROMPT_COMMAND' is a special environment variable name known to Bash
[ ${BASH_VERSION} ] && PROMPT_COMMAND=myprompt

# function called every time shell is about to draw prompt
myprompt() {
  # if [ ${ZSH_VERSION} ]; then
  #   # Zsh prompt expansion syntax
  #   PS1='%{%F{red}%}%n%{%f%}@%{%F{red}%}%m %{%F{cyan}%}%~ %{%F{white}%}%# %{%f%}'
  # elif [ ${BASH_VERSION} ]; then
  #   # Bash prompt expansion syntax
  #   PS1='\[\e[31m\]\u\[\e[0m\]@\[\e[31m\]\h \[\e[36m\]\w \[\e[37m\]\$ \[\e[0m\]'
  # fi

  # Zsh config vars
	gitbranch=$(git branch 2>&1 | grep '\*' | sed -e 's/\* //g')
  PS1=$'\n''%{%F{cyan}%}%B[%n]%b%{%f%} %{%F{cyan}%}%~'
  # PS1="${GREEN}\h${BOLD_CYAN} [\u] ${CYAN}\w${RED} 
	if [[ "$gitbranch" != "" ]]; then
    PS1=$PS1' %{%F{red}%}(%{$gitbranch%})'
    # PS1="${GREEN}\h${BOLD_CYAN} [\u] ${CYAN}\w${RED} (${gitbranch}) ${PURPLE}\n◆ ${LIGHT_GRAY}$ "
  fi
 
  PS1=$PS1'%{%F{005}%}'$'\n'' ◆ %{%f%}'
  # PS1=$PS1' ${PURPLE}\n◆ ${LIGHT_GRAY}$ '
}

# Remove right-hand prompt (for zsh)
RPROMPT=""

#SSH_KNOWN_HOSTS=( $(cat ~/.ssh/known_hosts | \
#  cut -f 1 -d ' ' | \
#  sed -e s/,.*//g | \
#  uniq | \
#  egrep -v [0123456789]) )
#SSH_CONFIG_HOSTS=( $(cat ~/.ssh/config | grep "Host " | grep -v "*" | cut -f 2 -d ' ') )

# complete -o default -W "${SSH_KNOWN_HOSTS[*]} ${SSH_CONFIG_HOSTS[*]}" ssh

WHOAMI=$(whoami)
export PATH=/usr/share/www/intranet.directstartv.com/scripts/srcsync-dir:/usr/local/bin:/usr/share/www/devops/scripts:$PATH
export NODE_PATH="/usr/local/bin/node:/usr/local/lib/node_modules:{$WHOAMI}/lib/node_modules"
export NODE_ENV=development


if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
