# 環境構築手順


<!-- vim-markdown-toc GFM -->

* [Wezterm](#wezterm)
* [Starship](#starship)
* [mdr](#mdr)
* [vim-plug](#vim-plug)
* [Neovim](#neovim)
* [rustup](#rustup)
* [Evcxr](#evcxr)
* [Rye](#rye)
* [exa](#exa)
* [bat](#bat)
* [fd](#fd)
* [procs](#procs)
* [ripgrep](#ripgrep)
* [universal-ctags](#universal-ctags)
* [php-cs-fixer](#php-cs-fixer)

<!-- vim-markdown-toc -->

## Wezterm

[https://wezfurlong.org/wezterm/](https://wezfurlong.org/wezterm/)をインストールする。

端末エミュレータ。

matplotlibの結果を表示するために次のコマンドを実行する。

```sh
pip install matplotlib-backend-wezterm
export MPLBACKEND='module://matplotlib-backend-wezterm'
```

コマンド一覧は次のコマンドで表示できる。

```sh
wezterm show-keys
```

次のコマンドで画像の表示も可能。

```
wezterm imgcat
```

ペイン関連コマンド。

|入力|効果|
|:--|:--|
|CTRL + SHIFT + META + "|垂直分割|
|CTRL + SHIFT + META + %|垂直分割|
|CTRL + SHIFT + Z|拡大|
|CTRL + SHIFT + LEFT/RIGHT/UP/DOWN|ペイン移動|
|CTRL + SHIFT + META + LEFT/RIGHT/UP/DOWN|ペイン領域の調整|

タブ関連コマンド

|入力|効果|
|:--|:--|
|CTRL + SHIFT + t|新規タブ作成|
|SUPER + [0-9]|対応するタブに移動|

その他コマンド。

|入力|効果|
|:--|:--|
|META + ENTER|全画面表示on/off|

## Starship

[https://starship.rs/](https://starship.rs/)

プロンプト設定ツール。

.bashrcや.zshrcの最後に以下を追記する。

```sh
eval "$(starship init zsh)"
```

## mdr

[https://github.com/MichaelMure/mdr](https://github.com/MichaelMure/mdr)

マークダウンビューワー。

## vim-plug

[https://github.com/junegunn/vim-plug](https://github.com/junegunn/vim-plug)

vim, Neovimのプラグインマネージャ。

## Neovim

[https://neovim.io](https://neovim.io)

テキストエディタ。

pythonプラグインを利用するために次のコマンドを実行する。

```sh
pip3 install pynvim
```

## rustup

[https://www.rust-lang.org/ja/tools/install](https://www.rust-lang.org/ja/tools/install)

Rustの管理ツール。

よく使うコマンド一覧。

|コマンド|効果|
|:--|:--|
|rustup update|アップデート|

## Evcxr

[https://github.com/evcxr/evcxr?tab=readme-ov-file](https://github.com/evcxr/evcxr?tab=readme-ov-file)

An evaluation context for Rust.

- jupyterで実行するには[ココ](https://github.com/evcxr/evcxr/blob/main/evcxr_jupyter/README.md)を参照。
- REPLで実行するには[ココ](https://github.com/evcxr/evcxr/blob/main/evcxr_repl/README.md)を参照。

## Rye

[https://rye.astral.sh/](https://rye.astral.sh/)

Pythonのプロジェクトマネージャ。

## exa

[https://github.com/ogham/exa](https://github.com/ogham/exa)

lsコマンドの代替。cargoによりインストール可能。

## bat

[https://github.com/sharkdp/bat](https://github.com/sharkdp/bat)

catコマンドの代替。cargoによりインストール可能。

## fd

[https://github.com/sharkdp/fd](https://github.com/sharkdp/fd)

findコマンドの代替。cargoによりインストール可能。

## procs

[https://github.com/dalance/procs](https://github.com/dalance/procs)

ps コマンドの代替。cargoによりインストール可能。

## ripgrep

grepコマンドの代替。cargoによりインストール可能。コマンドは`rg`であることに注意。

[https://github.com/BurntSushi/ripgrep](https://github.com/BurntSushi/ripgrep)

## universal-ctags

[https://github.com/universal-ctags/ctags](https://github.com/universal-ctags/ctags)

テキストファイルのタグジャンプのプログラム。

## php-cs-fixer

[https://github.com/PHP-CS-Fixer/PHP-CS-Fixer](https://github.com/PHP-CS-Fixer/PHP-CS-Fixer)

PHPファイル整形プログラム。
