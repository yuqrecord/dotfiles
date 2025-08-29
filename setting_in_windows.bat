@rem ] このファイルは管理者として実行する必要がある。
@rem ] Windowsで以下のファイルのシンボリックリンクを作成するためのbatファイル。
@rem ] - .vimrc
@rem ] - init.vim
@rem ] - .latexmkrc

@rem ] Vim
mklink %USERPROFILE%\_vimrc %~dp0init.vim

@rem ] Neovim
if not exist %USERPROFILE%\AppData\Local\nvim (
  mkdir %USERPROFILE%\AppData\Local\nvim
)
mklink %USERPROFILE%\AppData\Local\nvim\init.vim %~dp0init.vim

@rem ] latexmk
mklink %USERPROFILE%\.latexmkrc %~dp0.latexmkrc

@rem ] WezTerm
if not exist %USERPROFILE%\.config\wezterm (
  mkdir %USERPROFILE%\.config\wezterm
)
mklink %USERPROFILE%\.config\wezterm\wezterm.lua %~dp0wezterm.lua
