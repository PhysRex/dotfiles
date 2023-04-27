echo "loaded .zshrc"

# Run everytime on startup (with M1 macos laptops)
# softwareupdate --install-rosetta # install once
if [ $(arch) != "i386" ]; then
    # arch -x86_64 zsh
fi
# exec arch -x86_64 zsh

# Check current archtechture with
# uname -m


source ~/.bash_profile
