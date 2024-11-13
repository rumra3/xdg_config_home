#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"

if [ -d $HOME/AppImages ]; then
    export PATH="$PATH:$HOME/AppImages"
fi

# If running from tty1 start sway
[ "$(tty)" = "/dev/tty1" ] && exec sway
