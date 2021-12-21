#!/bin/bash

#] Unixシステムで以下のファイルのシンボリックリンクを作成するシェルスクリプト。
#] - .vimrc
#] - init.vim
#] - .latexmkrc
#] - .lesskey


#] 環境変数の有無を確認する
if [ -z ${XDG_CONFIG_HOME} ]; then
  XDG_CONFIG_HOME="${HOME}/.config"
fi


#] Vim
ln -fsn $(pwd)/init.vim ${HOME}/.vimrc


#] Neovim
if [ ! -d ${XDG_CONFIG_HOME}/nvim ]; then
  mkdir -p ${XDG_CONFIG_HOME}/nvim
fi
ln -fsn $(pwd)/init.vim ${XDG_CONFIG_HOME}/nvim/init.vim


#] latexmk
ln -fsn $(pwd)/.latexmkrc ${HOME}/.latexmkrc


#] less command
if [ $(uname) = 'Linux' ]; then
  ln -fsn $(pwd)/.lesskey ${HOME}/.lesskey
fi


echo "Sorry, One operation is left."
echo "Please add the following line to files such as '.bashrc':"
echo "    source $(pwd)/shell_setting.sh"
