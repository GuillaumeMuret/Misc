# Git alias
alias git-gerrit-hook='scp -P 29418 gerrit.parrot.biz:hooks/commit-msg .git/hooks'
alias gk='gitk --all --date-order &'
alias gl="git log -10 --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gc="git commit -m \"[DEV]"
alias gs="git status"
alias glost="git fsck --lost-found"
gt() {
    git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" | fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort --header "Press CTRL-S to toggle sort" --preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'git show --color=always % | head -$LINES'" --bind "enter:execute:echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'vim fugitive://\$(git rev-parse --show-toplevel)/.git//% < /dev/tty'"
}

# Useful directory
alias workscript='cd ${WORKSCRIPT}'
alias aosp='cd ${ANDROID_AOSP}'
alias essential='cd ${ESSENTIAL_AOSP}'
alias deploy='cd ${DEPLOY_CONFIG}'

# source home files
alias src-p='source ~/.profile'
alias src-a='source ~/.bash_aliases'
alias src-b='source ~/.bashrc'
alias src-z='source ~/.zshrc'

# Launch monkey test on android car
monkey() {
    adb -s ${TARGET} shell monkey -p $1 -v 5000
}

# adb path of package
packagepath() {
	adb -s ${TARGET} shell pm path $1
}

# adb version of apk
version() {
	adb shell dumpsys package $1 | grep versionName | cut -d= -f2
}

# adb list packages
alias listpackage="adb -s ${TARGET} shell 'pm list packages -f' | sed -e 's/.*=//' | sort"

# launch shell
alias targetshell="adb -s ${TARGET} shell"

# find a text in file
dirfind(){
	grep -rnw '.' -e $1
}

# Gradle command
alias gar="./gradlew assembleRelease"
alias gad="./gradlew assembleDebug"

# personal command
alias xo=xdg-open
alias .="source"

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -Ah'
alias l='ls -CFh'

# Target command 
alias cod='source connectPaciaDriver.sh'
alias cop='source connectPaciaPassenger.sh'
alias coe='source connectEssential.sh'

find_in_all_files(){
	find -name "$1" -exec grep --color -rHnwe "$2" {} \;
}

# Init desk
alias idesk='initDesk.sh'

#############################
# COMPUTER SPECIAL SOFTWARE #
#############################

# Use for decompile or recompile apk
alias apktool="java -jar /home/gmuret/Téléchargements/Programs/apktool_2.4.0.jar"

# Launch android studio
alias android-studio='sh /home/gmuret/Téléchargements/Programs/android-studio/bin/studio.sh &'

# Launch Pycharm
alias pycharm='sh /home/gmuret/Téléchargements/Programs/pycharm-community-2017.3.2/bin/pycharm.sh &'

# krita
alias krita='/home/gmuret/Téléchargements/Programs/krita-4.1.1-x86_64.appimage &'