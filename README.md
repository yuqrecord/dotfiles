# 設定ファイル集

環境に依存しない設定を一元管理するためのリポジトリである。

環境構築手順は[ココ](setup_manual.md)。

## 設定の反映

### Linux & Mac

反映方法は以下の通り。
1. `.bashrc` と`.zshrc` に`source [このファイルが存在するディレクトリ]/shell_setting.sh` を追加
1. `setting_files_in_unix.sh` を実行

### Windows

反映方法は以下の通り。
1. `setting_files_in_windows.bat` を管理者として実行

## Python パッケージのインストール

```sh
pip install -r requirements_py.txt
```
