echo "  > loaded .bash_profile"

source ~/.profile

alias python="python3"
alias pip="pip3"

PATH=$PATH:~/Library/Python/3.8/bin/virtualenvwrapper.sh:~/Library/Python/3.8/bin/virtualenv

# set the location where the virtual environments should live (python)
# Location of python 3.8: /usr/local/bin/python3.8
export VIRTUALENVWRAPPER_VIRTUALENV=~/Library/Python/3.8/bin/virtualenv
export WORKON_HOME=$HOME/.virtualenvs
# export VIRTUALENVWRAPPER_PYTHON='/usr/bin/python'
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
export PROJECT_HOME=$HOME/projects
source $HOME/Library/Python/3.8/bin/virtualenvwrapper.sh
# source /usr/local/bin/virtualenvwrapper.sh


# adding postgreSQL to $PATH
export PATH=/usr/local/Cellar/postgresql@9.5/9.5.19_1/bin/:$PATH

# Add Visual Studio Code (code)
# export PATH=/Applications/Visual Studio Code.app/Contents/Resources/app/bin/:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# get bluetooth battery levels
alias batteries='ioreg -l |egrep "BatteryPercent|Bluetooth Product Name"'

alias wiseup="workon wisersaver && source .env"
alias frontwiseup="wiseup && cd ~/projects/wisersaver/front_end/ && nvm use 14"

# start wisersaver server
alias startWisersaver="wiseup &&  python wisersaver/manage.py runserver 0:80"


# Alias for directories first search with gls
alias gls='gls -F --group-directories-first --color=always'

# aliases to run brew under arm and intel (rosetta)
alias brew='arch -arm64e /opt/homebrew/bin/brew'
alias ibrew='arch -x86_64 /usr/local/bin/brew'
export PATH=/opt/homebrew/bin:$PATH

# Start docker automatically & open start DBs on ready
#alias startDocker=`open --background -a Docker &&
#  while ! docker system info > /dev/null 2>&1; do sleep 1; done &&
#	docker-compose up -d postgres redis`


# AWS docker login
function ecr() {
    local com="$(aws ecr get-login --no-include-email --region us-east-1)"
    echo $com
    eval $com
}

function createPassword() {
    (openssl rand -base64 10 | pbcopy) && echo "Copied password to clipboard"
}

#neofetch
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
