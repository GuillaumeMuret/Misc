# Git alias
alias git-gerrit-hook='scp -P 29418 gerrit.parrot.biz:hooks/commit-msg .git/hooks'
alias gk='gitk --all --date-order &'
alias gl="git log -10 --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gc="git commit -m \"[DEV]"
alias glost="git fsck --lost-found"
alias gfa="git fetch --all"
alias gs="git status"
alias clear_tags="git tag -l | xargs git tag -d && git fetch --tags"
alias get_all_guigui_commit="git log --author=\"Guillaume Muret\" --format=\"%H\" | sed 's/$/^!/g' | xargs -I{} git format-patch {}"
gt() {
    git log --branches --remotes --tags --graph --oneline --decorate --date-order \
    	--color=always \
    	--format="%C(auto)%h%d %s %C(black)%C(bold)%cr" \
    	"$@" | fzf --ansi --no-sort --reverse --tiebreak=index \
    	--bind=ctrl-s:toggle-sort --header "Press CTRL-S to toggle sort" \
    	--preview "echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'git show --color=always % | head -10000'" \
    	--bind "enter:execute:echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'vim fugitive://\$(git rev-parse --show-toplevel)/.git//% < /dev/tty'"
}
alias resetAllRepo="repo forall -c \"git reset --hard ; git clean -fdx\""

# Useful directory
alias workscript='cd ${WORKSCRIPT}'
alias aosp='cd ${ANDROID_AOSP}'
alias essential='cd ${ESSENTIAL_AOSP}'
alias hyper='cd ${HYPER_RAPIDE_AOSP}'
alias rear='cd ${REAR8_RAPIDE_AOSP}'
alias front='cd ${FRONT8_RAPIDE_AOSP}'
alias deploy='cd ${DEPLOY_CONFIG}'

# Useful path from target aosp root path
alias apps='cd ${TARGET_AOSP_ROOT_PATH}/vendor/parrot/apps'
alias kernel='cd ${TARGET_AOSP_ROOT_PATH}/device/parrot/${TARGET_PRODUCT_OUT}'

# source home files
alias src-p='source ~/.profile'
alias src-a='source ~/.bash_aliases'
alias src-b='source ~/.bashrc'
alias src-z='source ~/.zshrc'

# Launch monkey test on android car
monkey() {
    adb -s ${TARGET} shell monkey -p $1 -v 5000
}

# Launch monkey test for 1 event on android car
monkey1() {
    adb -s ${TARGET} shell monkey -p $1 -v 1
}

alias logcat="adb -s ${TARGET} logcat -v color"
alias logcat_filter="adb -s ${TARGET} logcat -v color | grep -v GnssLocationProvider | grep -v MOCK_DEMO_APP | grep -v TcpSocketMonitor | grep -v MALVA_STAT_BAR_OVER"

# adb path of package
packagepath() {
	adb -s ${TARGET} shell pm path $1
}

# adb current activity displayed
alias adb_current_activity="adb shell dumpsys window windows | grep -E 'mCurrentFocus|mFocusedApp'"
# adb update target date
alias adb_date_sync="src-a && adb shell date $(date +%m%d%H%M%Y.%S)"
# adb update get resolution 
alias adb_screen_resolution="adb -s ${TARGET} shell dumpsys window displays | grep init | grep app"
# adb update get resolution 
alias adb_package_permissions="adb -s ${TARGET} shell dumpsys package com.parrot.car.localplayer | grep android.permission"

# adb version of apk
version() {
	adb shell dumpsys package $1 | grep versionName | cut -d= -f2
}

# adb list packages
alias listpackage="adb -s ${TARGET} shell 'pm list packages -f' | sed -e 's/.*=//' | sort"

# launch shell
alias targetshell="adb -s ${TARGET} shell"

# List current services
alias listservice="adb -s ${TARGET} shell dumpsys activity services"

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
alias coh='source connectHypervisor.sh'
alias coe='source connectEssential.sh'
alias cor='source connectRear8.sh'
alias cof='source connectFront8.sh'
alias adbt="adb -s ${TARGET}"

alias windowConfig="adb -s ${TARGET} shell dumpsys window | grep mGlobalConfiguration | grep mBounds=Rect"

find_in_all_files(){
	find -name "$1" -exec grep --color -rHnwe "$2" {} \;
}

# Init desk
alias idesk='initDesk.sh'

alias reboot="echo NO REBOOT !"

alias remove_empty_lines="^(?:[\t ]*(?:\r?\n|\r))+"

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
