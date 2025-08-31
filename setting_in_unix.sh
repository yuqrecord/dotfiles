#!/bin/bash

# Path of this script
readonly SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# Check environment variable
if [ -z ${XDG_CONFIG_HOME} ]; then
  XDG_CONFIG_HOME="${HOME}/.config"
fi


# WeZterm
if [ ! -d ${XDG_CONFIG_HOME}/wezterm ]; then
  mkdir -p ${XDG_CONFIG_HOME}/wezterm
fi
ln -fsn ${SCRIPTPATH}/wezterm.lua ${XDG_CONFIG_HOME}/wezterm/wezterm.lua


# Starship
if [ ! -d ${XDG_CONFIG_HOME} ]; then
  mkdir -p ${XDG_CONFIG_HOME}
fi
ln -fsn ${SCRIPTPATH}/starship.toml ${XDG_CONFIG_HOME}/starship.toml


# bat
if [ ! -d ${XDG_CONFIG_HOME}/bat ]; then
  mkdir -p ${XDG_CONFIG_HOME}/bat
fi
ln -fsn ${SCRIPTPATH}/bat_config ${XDG_CONFIG_HOME}/bat/config


# Vim
ln -fsn ${SCRIPTPATH}/init.vim ${HOME}/.vimrc


# Neovim
ln -fsn ${SCRIPTPATH}/nvim ${XDG_CONFIG_HOME}/nvim


# latexmk
ln -fsn ${SCRIPTPATH}/.latexmkrc ${HOME}/.latexmkrc


# less command
if [ $(uname) = 'Linux' ]; then
  ln -fsn ${SCRIPTPATH}/.lesskey ${HOME}/.lesskey
fi


echo "Sorry, One operation is left."
echo "Please add the following line to files such as '.bashrc':"
echo "    source ${SCRIPTPATH}/shell_setting.sh"
