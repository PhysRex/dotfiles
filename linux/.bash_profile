# echo "loading .bash_profile"

# Load .bashrc if you ARE in a TMUX multiplexer
if [[ -n $TMUX ]]; then
# echo "   > TMUX :: try loading .bashrc ..."
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# set the location where the virtual environments should live (python)
export VIRTUALENVWRAPPER_PYTHON='/usr/bin/python3'
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
export VIRTUALENVWRAPPER_VIRTUALENV=~/.local/bin/virtualenv
source ~/.local/bin/virtualenvwrapper.sh

# adding postgreSQL to $PATH
export PATH=/usr/local/Cellar/postgresql@9.5/9.5.15/bin/:$PATH

# Add Visual Studio Code (code)
# export PATH=/Applications/Visual Studio Code.app/Contents/Resources/app/bin/:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# get bluetooth battery levels
alias batteries='ioreg -l |egrep "BatteryPercent|Bluetooth Product Name"'

alias wiseup="workon wisersaver && source .env"

# start wisersaver server
alias startWisersaver="wiseup &&  python wisersaver/manage.py runserver"

# run manage.py command
alias pym="python wisersaver/manage.py"

alias python="python3"

# Alias for directories first search with gls
alias gls='gls -F --group-directories-first --color=always'

# Start docker automatically & open start DBs on ready
#alias startDocker=`open --background -a Docker &&
#  while ! docker system info > /dev/null 2>&1; do sleep 1; done &&
#	docker-compose up -d postgres redis`


# powerline daemon - for command prompt
#export PATH=$PATH:$HOME/Library/Python/3.6/bin
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /Users/mcampuzano/Library/Python/3.6/lib/python/site-packages/powerline/bindings/bash/powerline.sh

