# 設定ファイル集

環境に依存しない設定を一元管理するためのリポジトリである。

## 設定の反映

### Linux & Mac

反映される設定は以下の通り。
- bashrc
- zshrc
- Vim
- Neovim
- latexmk
- lessコマンド

反映方法は以下の通り。
1. `.bashrc` と`.zshrc` に`source [このファイルが存在するディレクトリ]/shell_setting.sh` を追加
1. `link_setting_files_in_unix.sh` を実行

### Windows

反映される設定は以下の通り。
- Vim
- Neovim
- latexmk

反映方法は以下の通り。
1. `link_setting_files_in_windows.bat` を管理者として実行

## Python パッケージのインストール

```sh
pip install -r requirements_py.txt
```

## インストールが必要なもの
- [Neovim](https://neovim.io)
- [MichaelMure/mdr](https://github.com/MichaelMure/mdr)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [universal-ctags](https://github.com/universal-ctags/ctags)
