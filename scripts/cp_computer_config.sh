#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


cp ~/.oh-my-zsh/custom/themes/guigui.zsh-theme ${CURRENT_DIR}/../configs/home/.oh-my-zsh/custom/themes/guigui.zsh-theme
cp ~/.bash_aliases ${CURRENT_DIR}/../configs/home/.bash_aliases
cp ~/.bashrc ${CURRENT_DIR}/../configs/home/.bashrc
cp ~/.git-prompt.sh ${CURRENT_DIR}/../configs/home/.git-prompt.sh
cp ~/.minirc.dfl ${CURRENT_DIR}/../configs/home/.minirc.dfl
cp ~/.zshrc ${CURRENT_DIR}/../configs/home/.zshrc
cp ~/.profile ${CURRENT_DIR}/../configs/home/.profile
cp ~/.vimrc ${CURRENT_DIR}/../configs/home/.vimrc
cp ~/.ssh/config ${CURRENT_DIR}/../configs/home/.ssh/config