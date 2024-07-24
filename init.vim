let mapleader = ","
let maplocalleader = "\\"

" ] ==========================================================================================================================
" ]
"1] Plugins
" ]
" ] ==========================================================================================================================

"] vim-plug is necessary.
"] The repository of vim-plug is <https://github.com/junegunn/vim-plug>.


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"1.1] Directory of plugins
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"] Neovim
if has('nvim')

  "] Windows
  if has('win32') || has('win64')
    call plug#begin('$USERPROFILE/AppData/Local/nvim-data/plugged')

  "] Linux & Mac
  else
    if $XDG_DATA_HOME == ''
      call plug#begin('~/.local/share/nvim/plugged')
    else
      call plug#begin('$XDG_DATA_HOME/nvim/plugged')
    endif
  endif

"] Vim
else
  "] Windows
  if has('win32') || has('win64')
    call plug#begin('$USERPROFILE/vimfiles/plugged')

  "] Linux & Mac
  else
    call plug#begin('~/.vim/plugged')
  endif
endif


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"1.2] Plugins
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"     ] ----------------------------------------------------------------------------------------------------------------------
"1.2.1] Vim and Neovim
"     ] ----------------------------------------------------------------------------------------------------------------------

"] Filer
Plug 'preservim/nerdtree'

"] Plugins related to nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'

"] Easy comment out
Plug 'tomtom/tcomment_vim'

"] Visualise white spaces at the end of lies
Plug 'bronson/vim-trailing-whitespace'

"] Customise a status bar
Plug 'vim-airline/vim-airline'

"] Display differece in Git
Plug 'airblade/vim-gitgutter'

"] Japanese help
Plug 'vim-jp/vimdoc-ja'

"] Display strings after replacing
Plug 'markonm/traces.vim'

"] Linter
Plug 'dense-analysis/ale'

"] Display tag information
Plug 'preservim/tagbar'

"] Window resizer
Plug 'simeji/winresizer'

"] Git operation
Plug 'tpope/vim-fugitive'

"] Additional C++ syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

"] Alignment
Plug 'junegunn/vim-easy-align'

"] Color scheme
Plug 'w0ng/vim-hybrid'

"] Formatter of Rust
Plug 'rust-lang/rust.vim'

"] Markdown preview
Plug 'skanehira/preview-markdown.vim'

"] Cursor motion
Plug 'skanehira/jumpcursor.vim'

"] Formatter for Python
Plug 'tell-k/vim-autopep8'

"] To deal jupyter notebook with vim
Plug 'goerz/jupytext.vim'

"] For jupyter notebook
Plug 'jupyter-vim/jupyter-vim'

"] Expanding HTML tags
Plug 'mattn/emmet-vim'

"] For a root directory of projects
Plug 'mattn/vim-findroot'

"] Display indent
if has('nvim')
  Plug 'lukas-reineke/indent-blankline.nvim'
endif

"] Complementation
if has('nvim')
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/neco-syntax'
  Plug 'Shougo/neco-vim'
  Plug 'deoplete-plugins/deoplete-jedi'
  if has('win32') || has('win64')
    Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
  else
    Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
  endif
endif


"     ] ----------------------------------------------------------------------------------------------------------------------
"1.2.2] Neoim only
"     ] ----------------------------------------------------------------------------------------------------------------------

call plug#end()


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"1.3] Setting of plugins
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"     ] ----------------------------------------------------------------------------------------------------------------------
"1.3.1] NERDTree
"     ] ----------------------------------------------------------------------------------------------------------------------

let NERDTreeShowHidden=1
let g:NERDTreeMapOpenSplit='h'
let g:NERDTreeMapPreviewVSplit='gh'
let g:NERDTreeMenuUp='i'
" nnoremap <Leader>e :NERDTreeTabsToggle<CR>
nnoremap <Leader>e :NERDTreeMirrorToggle<CR>


"     ] ----------------------------------------------------------------------------------------------------------------------
"1.3.2] Tagbar
"     ] ----------------------------------------------------------------------------------------------------------------------

let g:tagbar_map_togglecaseinsensitive='u'
nnoremap <Leader>t :TagbarToggle<CR>


"     ] ----------------------------------------------------------------------------------------------------------------------
"1.3.3] Winresizer
"     ] ----------------------------------------------------------------------------------------------------------------------

let g:winresizer_start_key='<Leader>r'

"] j: Right
"] l: Left (default)
"] i: Up
"] k: Down
let g:winresizer_keycode_left = 106
let g:winresizer_keycode_up   = 105
let g:winresizer_keycode_down = 107


"     ] ----------------------------------------------------------------------------------------------------------------------
"1.3.4] ale
"     ] ----------------------------------------------------------------------------------------------------------------------

" let g:ale_cursor_detail = 1
let g:ale_detail_to_floating_preview = 1
let g:ale_rust_cargo_use_clippy = 1
let g:ale_rust_cargo_check_all_targets = 1
let g:ale_rust_cargo_check_tests = 1
let g:ale_rust_cargo_check_examples = 1
let g:ale_rust_cargo_avoid_whole_workspace = 0
nnoremap <Leader>aa :ALEDetail<CR>
nnoremap <Leader>af :ALENextWrap<CR>
nnoremap <Leader>ab :ALEPreviousWrap<CR>

" php-cs-fixerへのパス
let g:ale_php_php_cs_fixer_executable='/usr/local/bin/php-cs-fixer'
" phpのコード整形はphp_cs_fixerを利用するように指定(「-」ではなく「_」であるのに注意)
let g:ale_fixers = {'php': ['php_cs_fixer']}
" 保存時にコード整形を実行
let g:ale_fix_on_save = 1


"     ] ----------------------------------------------------------------------------------------------------------------------
"1.3.5] git-gutter
"     ] ----------------------------------------------------------------------------------------------------------------------

set signcolumn=yes


"     ] ----------------------------------------------------------------------------------------------------------------------
"1.3.6] vim-cpp-enhanced-highlight
"     ] ----------------------------------------------------------------------------------------------------------------------

let g:cpp_class_scope_highlight                  = 1
let g:cpp_member_variable_highlight              = 1
let g:cpp_class_decl_highlight                   = 1
let g:cpp_posix_standard                         = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_no_function_highlight                  = 1


"     ] ----------------------------------------------------------------------------------------------------------------------
"1.3.7] deoplete
"     ] ----------------------------------------------------------------------------------------------------------------------

let g:deoplete#enable_at_startup = 1


"     ] ----------------------------------------------------------------------------------------------------------------------
"1.3.8] rust-lang/rust.vim
"     ] ----------------------------------------------------------------------------------------------------------------------

let g:rustfmt_autosave = 1


"     ] ----------------------------------------------------------------------------------------------------------------------
"1.3.9] skanehira/preview-markdown.vim
"     ] ----------------------------------------------------------------------------------------------------------------------

nmap <Leader>j <Plug>(jumpcursor-jump)
let g:preview_markdown_auto_update = 1

"     ] ----------------------------------------------------------------------------------------------------------------------
"1.3.10] tell-k/vim-autopep8
"     ] ----------------------------------------------------------------------------------------------------------------------

let g:autopep8_disable_show_diff = 1
let g:autopep8_on_save = 1

"     ] ----------------------------------------------------------------------------------------------------------------------
"1.3.11] goerz/jupytext.vim
"     ] ----------------------------------------------------------------------------------------------------------------------

let g:jupytext_fmt = 'py:percent'
let g:jupytext_filetype_map = {'py': 'python'}

"     ] ----------------------------------------------------------------------------------------------------------------------
"1.3.12] mattn/emmet-vim
"     ] ----------------------------------------------------------------------------------------------------------------------

let g:user_emmet_leader_key = '<c-g>'

"     ] ----------------------------------------------------------------------------------------------------------------------
"1.3.13] mattn/vim-findroot
"     ] ----------------------------------------------------------------------------------------------------------------------

let g:findroot_not_for_subdir = 0


" ] ==========================================================================================================================
" ]
"2] Personal setting (Any filetypes )
" ]
" ] ==========================================================================================================================

set encoding=UTF-8

"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"2.1] General
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"     ] ----------------------------------------------------------------------------------------------------------------------
"2.1.1] Color
"     ] ----------------------------------------------------------------------------------------------------------------------

"] Syntax coloring
syntax on

"] Syntax coloring for shellscript
let g:is_bash = 1

"] Color scheme
if has('nvim')
  set background=dark
  colorscheme hybrid
  nnoremap <Leader>c :highlight Normal ctermbg=none<CR>:highlight CursorLine ctermbg=none<CR>
endif

"] Color of comment lines
if ! has('nvim')
  hi Comment ctermfg=cyan
endif

"] Setting corlor of word search
if ! has('nvim')
  hi Search ctermbg=none
  hi Search cterm=underline,bold
endif

"] Hilighting the cursor line
set cursorline

"] No highliting the parenthis
"let loaded_matchparen = 1


"     ] ----------------------------------------------------------------------------------------------------------------------
"2.1.2] Others
"     ] ----------------------------------------------------------------------------------------------------------------------

"] Path of python3
if has('win32') || has('win64')
  let g:python3_host_prog = '$USERPROFILE/AppData/Local/Programs/Python/Python39/python.exe'
else
  let g:python3_host_prog = system('echo -n $(which python3)')
endif

"] Identify file types
filetype on

"] Display line number
set number

"] No wrap a line
set nowrap

"] Sabstitute space for tab
set expandtab

"] Insert autoindent
set autoindent

"] Width of tab key
set tabstop=2

"] Width of autoindent
set shiftwidth=2

"] Not beep and visual bell
set visualbell t_vb=

"] Setting for tag jumping
set tag=./.tags;,.tags;

"] No backup file
set nobackup

"] No undo file
set noundofile


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"2.2] Change key bind
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


"     ] ----------------------------------------------------------------------------------------------------------------------
"2.2.1] Normal mode
"     ] ----------------------------------------------------------------------------------------------------------------------


"       ]
"2.2.1.1] Open terminal
"       ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"] Open terminal in
"] #: Horizontal spliting window
"] $: Vertical spliting window
if has('nvim')
  nnoremap " :tab sp<CR>:terminal<CR>a
  nnoremap # :sp<CR>:terminal<CR>a
  nnoremap $ :vsp<CR>:terminal<CR>a
else
  nnoremap # :top terminal ++close<CR>
  nnoremap $ :vert terminal ++close<CR>
endif


"       ]
"2.2.1.2] Others
"       ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"] Redrawing window
nnoremap <c-y> <c-l>

"] Unset hilight of searched words
nnoremap m :noh<CR>

"] Move from a window to another window
"] <c-w>l: Right (default)
"] <c-w>j: Left
"] <c-w>i: Up
"] <c-w>k: Down
nnoremap <c-w>j <c-w>h
nnoremap <c-w>k <c-w>j
nnoremap <c-w>i <c-w>k

"] Split window vertically
nnoremap <c-w>h <c-w>i

"] Open a new tab which is related to tha word under the cursor
nnoremap <c-h> :tab sp<CR> :exe("tjump ".expand('<cword>'))<CR>

"] Moving tab window
"] <c-p>: previous
"] <c-n>: next
nnoremap <c-p> gT
nnoremap <c-n> gt


"     ] ----------------------------------------------------------------------------------------------------------------------
"2.2.2] Normal mode and visual mode
"     ] ----------------------------------------------------------------------------------------------------------------------


"       ]
"2.2.2.1] Cursor moving
"       ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"] Move cursor to an adjucent character
"] l: Right (default)
"] j: Left
"] i: Up
"] k: Down
noremap j h
noremap i k
noremap k j

"] Move cursor to an edge of a line
"] <c-l>: Right
"] <c-j>: Left
noremap <c-l> $
noremap <c-j> 0

"] Move cursor to a position in jumping  history
"] <c-o>: Old (default)
"] <c-u>: New (default)
noremap <c-u> <c-i>


"       ]
"2.2.2.2] Window moving
"       ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"] Move one line
"] zl: Right (default)
"] zh: Left (default)
"] <c-i>: Up
"] <c-k>: Down
"] <Right>: Right
"] <Left>: Left
"] <Up>: Up
"] <Down>: Down
noremap <c-i> <c-y>
noremap <c-k> <c-e>
noremap <Right> zl
noremap <Left> zh
noremap <Up> <c-y>
noremap <Down> <c-e>

"] Move half window
"] zL: Right (default)
"] zH: Left (default)
"] <c-e>: Up
"] <c-d>: Down (default)
"] <s-Right>: Right
"] <s-Left>: Left
noremap <c-e> <c-u>
noremap <s-Right> zL
noremap <s-Left> zH


"       ]
"2.2.2.3] Others
"       ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"] Change into insert mode
"] s: With nothing
"] S: in visual mode, editing some lines
"] h: With deleting a character under the cursor and insert
noremap s i
noremap S I
noremap h s


"     ] ----------------------------------------------------------------------------------------------------------------------
"2.2.3] Insert mode
"     ] ----------------------------------------------------------------------------------------------------------------------

"] Move cursor to an adjucent character
"] <c-f>: Right (default)
"] <c-b>: Left
inoremap <C-f> <Right>
inoremap <c-b> <Left>

"] Escape from insert mode
inoremap <c-l> <ESC>

"] Complete parenthis
inoremap ( ()<Left>

"] Switch off the keybind of ctrl-k (write a multi byte charcter) in the insert mode
inoremap <c-k> <NOP>


"     ] ----------------------------------------------------------------------------------------------------------------------
"2.2.4] Terminal mode
"     ] ----------------------------------------------------------------------------------------------------------------------

"] Change from Terminal-Normal mode into Terminal-Job mode
tnoremap <Esc> <c-\><c-n>

"] Close terminal
if has('nvim')
  tnoremap <c-o> <c-\><c-n>:q<CR>
endif

"] Move from a window to another window
if has('nvim')
  tnoremap <c-g> <c-\><c-n><c-w><c-w>
endif


"] Immidiately change into Terminal-Job mode
if has('nvim')
  autocmd WinEnter * if &buftype ==# 'terminal' | startinsert | endif
else
  autocmd WinEnter * if &buftype ==# 'terminal' | normal i | endif
endif





" ] ==========================================================================================================================
" ]
"3] Personal setting (Each filetype)
" ]
" ] ==========================================================================================================================


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"3.1] Makefile
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

augroup makefiles
  autocmd!
  "] No sabstitute space for tab
  autocmd BufRead,BufNewFile makefile set noexpandtab
augroup END


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"3.2] C
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

augroup h_files
  autocmd!
  autocmd BufRead,BufNewFile,WinEnter *.h inoremap { {<CR>}<ESC><S-o>
  autocmd BufRead,BufNewFile,WinEnter *.h inoremap ( ()<Left>
  autocmd BufRead,BufNewFile,WinEnter *.h inoremap " ""<Left>
  autocmd BufRead,BufNewFile,WinEnter *.h inoremap ' ''<Left>
  autocmd BufRead,BufNewFile,WinEnter *.h inoremap [ []<Left>
  autocmd BufRead,BufNewFile,WinEnter *.h inoremap <c-k><c-f> for<Space>(<Space>;<Space>;<Space>)<Space>{<CR>}<ESC><UP>$6<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.h inoremap <c-k><c-i> if<space>(<space>)<space>{<CR>}<ESC><UP>$2<left>i
  autocmd BufRead,BufNewFile,WinEnter *.h inoremap <c-k><c-w> while<space>(<space>)<space>{<CR>}<ESC><UP>$2<left>i
  autocmd BufRead,BufNewFile,WinEnter *.h inoremap <c-k><c-t> try {<CR>} catch (<Space><Space>){<CR>}<ESC><UP>$2<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.h inoremap <c-k>i< #include <><LEFT>
  autocmd BufRead,BufNewFile,WinEnter *.h inoremap <c-k>i" #include ""<LEFT>
augroup END

augroup c_files
  autocmd!
  autocmd BufRead,BufNewFile,WinEnter *.c inoremap { {<CR>}<ESC><S-o>
  autocmd BufRead,BufNewFile,WinEnter *.c inoremap ( ()<Left>
  autocmd BufRead,BufNewFile,WinEnter *.c inoremap " ""<Left>
  autocmd BufRead,BufNewFile,WinEnter *.c inoremap ' ''<Left>
  autocmd BufRead,BufNewFile,WinEnter *.c inoremap [ []<Left>
  autocmd BufRead,BufNewFile,WinEnter *.c inoremap <c-k><c-k> #include<Space><stdio.h><CR>#include<Space><stdlib.h><CR><CR>int<Space>main<Space>(<Space>int<Space>argc,<Space>char<Space>*argv[]<Space>){<CR>}<ESC><s-o>
  autocmd BufRead,BufNewFile,WinEnter *.c inoremap <c-k><c-f> for<Space>(<Space>;<Space>;<Space>)<Space>{<CR>}<ESC><UP>$6<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.c inoremap <c-k><c-i> if<space>(<space>)<space>{<CR>}<ESC><UP>$2<left>i
  autocmd BufRead,BufNewFile,WinEnter *.c inoremap <c-k><c-w> while<space>(<space>)<space>{<CR>}<ESC><UP>$2<left>i
  autocmd BufRead,BufNewFile,WinEnter *.c inoremap <c-k>i< #include <><LEFT>
  autocmd BufRead,BufNewFile,WinEnter *.c inoremap <c-k>i" #include ""<LEFT>
augroup END


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"3.3] C++
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

augroup hpp_files
  autocmd!
  autocmd BufRead,BufNewFile,WinEnter *.hpp set cino=N-s
  autocmd BufRead,BufNewFile,WinEnter *.hpp inoremap { {<CR>}<ESC><S-o>
  autocmd BufRead,BufNewFile,WinEnter *.hpp inoremap ( ()<Left>
  autocmd BufRead,BufNewFile,WinEnter *.hpp inoremap " ""<Left>
  autocmd BufRead,BufNewFile,WinEnter *.hpp inoremap ' ''<Left>
  autocmd BufRead,BufNewFile,WinEnter *.hpp inoremap [ []<Left>
  autocmd BufRead,BufNewFile,WinEnter *.hpp inoremap <c-k><c-f> for<Space>(<Space>;<Space>;<Space>)<Space>{<CR>}<ESC><UP>$6<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.hpp inoremap <c-k><c-i> if<Space>(<Space>)<Space>{<CR>}<ESC><UP>$2<left>i
  autocmd BufRead,BufNewFile,WinEnter *.hpp inoremap <c-k><c-w> while<Space>(<Space>)<Space>{<CR>}<ESC><UP>$2<left>i
  autocmd BufRead,BufNewFile,WinEnter *.hpp inoremap <c-k><c-t> try<Space>{<CR>}<Space>catch<Space>(<Space><Space>){<CR>}<ESC><UP>$2<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.hpp inoremap <c-k>i< #include<Space><><LEFT>
  autocmd BufRead,BufNewFile,WinEnter *.hpp inoremap <c-k>i" #include<Space>""<LEFT>
augroup END

augroup cpp_files
  autocmd!
  autocmd BufRead,BufNewFile,WinEnter *.cpp set cino=N-s
  autocmd BufRead,BufNewFile,WinEnter *.cpp inoremap { {<CR>}<ESC><S-o>
  autocmd BufRead,BufNewFile,WinEnter *.cpp inoremap ( ()<Left>
  autocmd BufRead,BufNewFile,WinEnter *.cpp inoremap " ""<Left>
  autocmd BufRead,BufNewFile,WinEnter *.cpp inoremap ' ''<Left>
  autocmd BufRead,BufNewFile,WinEnter *.cpp inoremap [ []<Left>
  autocmd BufRead,BufNewFile,WinEnter *.cpp inoremap <c-k><c-k> #include <iostream><CR><CR>int main ( const int argc, const char* const argv[] ){<CR>}<ESC><s-o>
  autocmd BufRead,BufNewFile,WinEnter *.cpp inoremap <c-k><c-f> for<Space>(<Space>;<Space>;<Space>)<Space>{<CR>}<ESC><UP>$6<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.cpp inoremap <c-k><c-i> if<Space>(<Space>)<Space>{<CR>}<ESC><UP>$2<left>i
  autocmd BufRead,BufNewFile,WinEnter *.cpp inoremap <c-k><c-w> while<Space>(<Space>)<Space>{<CR>}<ESC><UP>$2<left>i
  autocmd BufRead,BufNewFile,WinEnter *.cpp inoremap <c-k><c-t> try<Space>{<CR>}<Space>catch<Space>(<Space><Space>){<CR>}<ESC><UP>$2<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.cpp inoremap <c-k>i< #include<Space><><LEFT>
  autocmd BufRead,BufNewFile,WinEnter *.cpp inoremap <c-k>i" #include<Space>""<LEFT>
augroup END


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"3.4] Python
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

augroup py_files
  autocmd!
  autocmd BufRead,BufNewFile,WinEnter *.py set tabstop=4
  autocmd BufRead,BufNewFile,WinEnter *.py inoremap ( ()<Left>
  autocmd BufRead,BufNewFile,WinEnter *.py inoremap { {}<Left>
  autocmd BufRead,BufNewFile,WinEnter *.py inoremap [ []<Left>
  autocmd BufRead,BufNewFile,WinEnter *.py inoremap " ""<Left>
  autocmd BufRead,BufNewFile,WinEnter *.py inoremap ' ''<Left>
  autocmd BufRead,BufNewFile,WinEnter *.py inoremap <c-k><c-f> for<Space><Space>in<Space>:<Esc>4<Left>i
  autocmd BufRead,BufNewFile,WinEnter *.py inoremap <c-k><c-i> if<Space>:<Left>
augroup END


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"3.5] Fortran
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

augroup f90_files
  autocmd!
  autocmd BufRead,BufNewFile,WinEnter *.f90 let fortran_free_source=1
  autocmd BufRead,BufNewFile,WinEnter *.f90 highlight def link fortranContinueMark Identifier
  autocmd BufRead,BufNewFile,WinEnter *.f90 highlight link fortranTab NONE
  autocmd BufRead,BufNewFile,WinEnter *.f90 noremap ;; :!make<CR>
  autocmd BufRead,BufNewFile,WinEnter *.f90 noremap <c-m> :s/^/!/<CR>:noh<CR>
  autocmd BufRead,BufNewFile,WinEnter *.f90 noremap <c-n> :s/^!//<CR>:noh<CR>
  autocmd BufRead,BufNewFile,WinEnter *.f90 inoremap ( ()<Left>
  autocmd BufRead,BufNewFile,WinEnter *.f90 inoremap " ""<Left>
  autocmd BufRead,BufNewFile,WinEnter *.f90 inoremap ' ''<Left>
  autocmd BufRead,BufNewFile,WinEnter *.f90 inoremap <c-k><c-d> do<space><CR>end<space>do<ESC>k$a
  autocmd BufRead,BufNewFile,WinEnter *.f90 inoremap <c-k><c-i> if<CR>end<space>if<ESC>k$a()then<ESC>4<Left>i
  autocmd BufRead,BufNewFile,WinEnter *.f90 inoremap <c-k><c-p> program<CR>end<space>program<ESC><s-o><tab>implicit<space>none<ESC>kA<space>
  autocmd BufRead,BufNewFile,WinEnter *.f90 inoremap <c-k>4 !==    ==!<ESC>4hi
  autocmd BufRead,BufNewFile,WinEnter *.f90 inoremap <c-k>5 !--    --!<ESC>4hi
  autocmd BufRead,BufNewFile,WinEnter *.f90 inoremap <c-k>6 !=><space><space>
augroup END


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"3.6] Shellscript
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

augroup sh_files
  autocmd!
  autocmd BufRead,BufNewFile,WinEnter *.sh inoremap { {}<Left>
  autocmd BufRead,BufNewFile,WinEnter *.sh inoremap ( ()<Left>
  autocmd BufRead,BufNewFile,WinEnter *.sh inoremap " ""<Left>
  autocmd BufRead,BufNewFile,WinEnter *.sh inoremap ' ''<Left>
  autocmd BufRead,BufNewFile,WinEnter *.sh inoremap [ []<Left>
  autocmd BufRead,BufNewFile,WinEnter *.sh inoremap <c-k><c-k> #!/bin/bash<CR>
  autocmd BufRead,BufNewFile,WinEnter *.sh inoremap <c-k><c-f> for<Space><Space>in<Space>;<Space>do<CR>done<UP>
  autocmd BufRead,BufNewFile,WinEnter *.sh inoremap <c-k><c-i> if<Space>[<Space><Space>];<Space>then<CR>fi<UP><ESC>3<RIGHT>a
augroup END


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"3.7] Java
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

augroup java_files
  autocmd!
  autocmd BufRead,BufNewFile,WinEnter *.java inoremap { {<CR>}<ESC><S-o>
  autocmd BufRead,BufNewFile,WinEnter *.java inoremap ( ()<Left>
  autocmd BufRead,BufNewFile,WinEnter *.java inoremap " ""<Left>
  autocmd BufRead,BufNewFile,WinEnter *.java inoremap [ []<Left>
augroup END


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"3.8] LaTeX
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

augroup tex_files
  autocmd!
  if has('nvim')
    " autocmd BufRead,BufNewFile,WinEnter *.tex nnoremap ;; :term<Space>latexmk<Space>%<CR><c-w><c-w>
    " autocmd BufRead,BufNewFile,WinEnter *.tex nnoremap ;a :term<Space>latexmk<Space>-pvc<Space>%<CR><c-w><c-w>z42<CR>
  else
    autocmd BufRead,BufNewFile,WinEnter *.tex nnoremap ;; :term<Space>++close<Space>latexmk<Space>%<CR><c-w><c-w>
    autocmd BufRead,BufNewFile,WinEnter *.tex nnoremap ;a :term<Space>++close<SPace>latexmk<Space>-pvc<Space>%<CR><c-w><c-w>z42<CR>
  endif
  autocmd BufRead,BufNewFile,WinEnter *.tex nnoremap f :set<Space>spell<CR>
  autocmd BufRead,BufNewFile,WinEnter *.tex nnoremap F :set<Space>nospell<CR>
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap ( ()<Left>
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap { {}<Left>
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap [ []<Left>
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap $ $$<Left>
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap <c-k><c-k> \documentclass[a4paper,dvipdfmx,11pt]{jsarticle}<CR><CR>\usepackage{amsmath,amssymb}<CR>\usepackage{newtxtext,newtxmath}<CR>\usepackage{bm}<CR>\usepackage{physics}<CR>\usepackage{float}<CR>\usepackage{graphicx}<CR>\usepackage{color}<CR>\usepackage{hyperref}<CR>\usepackage{pxjahyper}<CR>\hypersetup{colorlinks=true,urlcolor=blue,linkcolor=cyan,citecolor=cyan}<CR><CR>\graphicspath{{./images/}}<CR><CR>\begin{document}<CR>\end{document}<ESC>
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap <c-k><c-t> \title{}<CR>\author{}<CR>\date{}<CR>\maketitle<ESC>3k$i
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap <c-k>u \usepackage{}<Left>
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap <c-k>e \begin{equation}<CR>\end{equation}<ESC><s-o>
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap <c-k>a \begin{align}<CR>\end{align}<ESC><s-o>
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap <c-k>i \begin{itemize}<CR>\item<CR>\end{itemize}<ESC><up><s-a><CR>
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap <c-k><c-e> \begin{enumerate}<CR>\item<CR>\end{enumerate}<ESC><up><s-a><CR>
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap <c-k>f \begin{figure}<CR>\centering<CR>\includegraphics[width=\columnwidth]{}<CR>\caption{}%<CR>\label{fig:}<CR>\end{figure}<ESC>3k$i
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap <c-k>t \begin{table}[htbp]<CR>\caption{}%<CR>\label{tab:}<CR>\begin{center}<CR>\setlength{\tabcolsep}{3pt}<CR>\footnotesize<CR>\begin{tabular}{ll}<CR>A & B \\ \hline<CR>a1 & b1 \\<CR>a2 & b2 \\<CR>\end{tabular}<CR>\end{center}<CR>\end{table}%
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap <c-k>b \begin{}<CR>\end{}<ESC><up>$i
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap <c-k>1 \chapter{}<Left>
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap <c-k>2 \section{}<Left>
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap <c-k>3 \subsection{}<Left>
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap <c-k>4 \subsubsection{}<Left>
  autocmd BufRead,BufNewFile,WinEnter *.tex inoremap <c-k>/ \frac{}{}<Left><Left><Left>
augroup END


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"3.9] Markdown
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

augroup md_files
  autocmd!
  autocmd BufRead,BufNewFile,WinEnter *.md set noexpandtab
  autocmd BufRead,BufNewFile,WinEnter *.md nnoremap f :set spell<CR>
  autocmd BufRead,BufNewFile,WinEnter *.md nnoremap F :set nospell<CR>
augroup END


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"3.10] HTML
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

augroup html_files
  autocmd!
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap ( ()<Left>
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap " ""<Left>
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap ' ''<Left>
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap [ []<Left>
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap { {}<Left>
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k><c-j> <br><CR>
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k><c-k> <!DOCTYPE html><CR><CR><html lang="ja"><CR></html><ESC><s-o><tab><head><CR></head><CR><CR><body><CR></body><ESC>3<up><s-o><tab><meta charset="utf-8"><CR><title>page title</title><CR><link rel="stylesheet" href=""><ESC>G<UP><s-o><tab><div id="page"><CR></div><ESC><s-o><tab><header><CR></header><CR><CR><article><CR></article><CR><CR><footer><CR></footer><ESC>gg
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k><c-t> <table><CR></table><ESC><s-o><tab><caption></caption><CR><thead><CR></thead><ESC><s-o><TAB><tr><CR></tr><ESC><s-o><TAB><th></th><CR><th></th><ESC>2<DOWN>o<tbody><CR></tbody><ESC><s-o><TAB><tr><CR></tr><ESC><s-o><TAB><th></th><CR><td></td><ESC>2<DOWN>o<tfoot><CR></tfoot><ESC><s-o><TAB><tr><CR></tr><ESC><s-o><TAB><th></th><CR><td></td><ESC>17<UP>
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>1 <h1></h1><ESC>4<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>2 <h2></h2><ESC>4<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>3 <h3></h3><ESC>4<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>4 <h4></h4><ESC>4<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>5 <h5></h5><ESC>4<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>6 <h6></h6><ESC>4<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>a <a href=""></a><ESC>5<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>button <button></button><ESC>8<left>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>c <code class=""></code><ESC>8<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>d <div class=""><CR></div><ESC><UP>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>m <meta ><left>
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>in <input type=""><left><left>
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>im <img src="" alt="" width="" height=""><ESC>27<left>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>l <li></li><ESC>4<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>sec <section class=""><CR></section><ESC><UP>$<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>sel <select><CR></select><ESC><s-o><option value=""></option><ESC>10<left>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>ol <ol><CR></ol><ESC><s-o><tab><li></li><ESC>4<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>op <option value=""></option><ESC>10<left>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>p <a<BS>p></p><ESC>3<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>td <td></td><ESC>4<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>th <th></th><ESC>4<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>tr <tr><CR></tr><ESC><s-o><TAB>
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>textarea <textarea cols="" rows=""></textarea><ESC>20<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.html inoremap <c-k>ul <ul><CR></ul><ESC><s-o><tab><li></li><ESC>4<LEFT>i
augroup END


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"3.11] CSS
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

augroup css_files
  autocmd!
  autocmd BufRead,BufNewFile,WinEnter *.css inoremap { {<CR>}<ESC><S-o>
augroup end


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"3.12] Vim sript
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

augroup vim_files
  autocmd!
  autocmd BufRead,BufNewFile,WinEnter *.vim inoremap <c-k><c-i> if<CR>endif<Esc><Up>$a<Space>
augroup end


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"3.13] Rust
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

augroup rust_files
  autocmd!
  autocmd BufRead,BufNewFile,WinEnter *.rs inoremap " ""<Left>
  autocmd BufRead,BufNewFile,WinEnter *.rs inoremap { {}<Left>
  autocmd BufRead,BufNewFile,WinEnter *.rs inoremap [ []<Left>
  autocmd BufRead,BufNewFile,WinEnter *.rs inoremap <c-k><c-f> for<Space><Space>in<Space><Space>{<CR>}<ESC><Up>4<Right>i
  autocmd BufRead,BufNewFile,WinEnter *.rs inoremap <c-k><c-i> if<Space><Space>{<CR>}<ESC><Up>3<Right>i
augroup END


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"3.14] PHP
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

augroup h_files
  autocmd!
  " autocmd BufRead,BufNewFile,WinEnter *.PHP inoremap { {<CR>}<ESC><S-o>
  autocmd BufRead,BufNewFile,WinEnter *.PHP inoremap { {}<Left>
  autocmd BufRead,BufNewFile,WinEnter *.PHP inoremap ( ()<Left>
  autocmd BufRead,BufNewFile,WinEnter *.PHP inoremap " ""<Left>
  autocmd BufRead,BufNewFile,WinEnter *.PHP inoremap ' ''<Left>
  autocmd BufRead,BufNewFile,WinEnter *.PHP inoremap [ []<Left>
  autocmd BufRead,BufNewFile,WinEnter *.PHP inoremap <c-k><c-f> for<Space>(;<Space>;<Space>)<Space>{<CR>}<ESC><UP>$6<LEFT>i
  autocmd BufRead,BufNewFile,WinEnter *.PHP inoremap <c-k><c-i> if<space>()<space>{<CR>}<ESC><UP>$2<left>i
  autocmd BufRead,BufNewFile,WinEnter *.PHP inoremap <c-k><c-w> while<space>()<space>{<CR>}<ESC><UP>$2<left>i
  autocmd BufRead,BufNewFile,WinEnter *.PHP inoremap <c-k><c-t> try {<CR>} catch (){<CR>}<ESC><UP>$2<LEFT>i
augroup END


"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"3.15] Markdown
"   ] ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

augroup markdown_files
  autocmd!
  autocmd BufRead,BufNewFile,WinEnter *.md nnoremap <c-k><c-o> :PreviewMarkdown<CR>
augroup END
