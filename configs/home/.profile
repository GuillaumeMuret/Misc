# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Variable for docker
export CCACHE_DIR=$HOME/.ccache

# Variable for android home
export ANDROID_HOME='/media/gmuret/d5e0b3b1-bb60-47f0-a636-2e9a02fbd766/AndroidSDK'

# Source my script
source ~/Misc/tools/scripts/gmuret/config/COMPUTER_ID.sh
source ~/Misc/tools/scripts/gmuret/config/common.sh

# Android path
PATH="/media/gmuret/d5e0b3b1-bb60-47f0-a636-2e9a02fbd766/AndroidSDK/platform-tools/:$PATH"
PATH="/media/gmuret/d5e0b3b1-bb60-47f0-a636-2e9a02fbd766/AndroidSDK/build-tools/28.0.1/:$PATH"
PATH="/home/gmuret/Téléchargements/Programs/android-studio/jre/bin/:$PATH"

# My script path
PATH="${WORKSCRIPT}/docker/:$PATH"
PATH="${WORKSCRIPT}/flash/:$PATH"
PATH="${WORKSCRIPT}/init/:$PATH"
PATH="${WORKSCRIPT}/push/:$PATH"
PATH="${WORKSCRIPT}/screen/:$PATH"
PATH="${WORKSCRIPT}/target/:$PATH"
PATH="${WORKSCRIPT}/tool/:$PATH"
