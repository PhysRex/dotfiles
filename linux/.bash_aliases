# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
alias ls='ls --group-directories-first -F -v'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
# alias l='ls -CF'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --group-directories-first -F -v'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


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
# alias gc='git commit -v'
alias gc='./scripts/code_style_check.py && git commit -v'
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

alias h?="history | grep "

# display battery info on your Mac
# see http://blog.justingreer.com/post/45839440/a-tale-of-two-batteries
alias battery='ioreg -w0 -l | grep Capacity | cut -d " " -f 17-50'

