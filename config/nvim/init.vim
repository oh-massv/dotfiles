set encoding=utf-8
scriptencoding utf-8

set t_Co=256 "ターミナルで256色表示を使う

set noswapfile

set mouse=

"-------画面表示設定-------
set number         " 行番号を表示する
set cursorline     " カーソル行の背景色を変える
set title " タイトルをウインドウ枠に表示する
set relativenumber

"-------ファイル処理関連の設定-------
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る

"-------検索/置換の設定-------
set hlsearch "検索文字列をハイライトする
set ignorecase " 大文字と小文字を区別しない
set smartcase " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する

"-------タブ/インデントの設定-------
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=2 " 画面上でタブ文字が占める幅
set shiftwidth=2 " smartindentで増減する幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する

"-------動作環境との統合関連の設定-------
set clipboard=unnamed " ヤンクでクリップボードにコピー

" set clipboard=unnamed,autoselect

"-------キー設定-------

let mapleader=","

noremap <Leader>w :w<CR>
noremap <Leader>q :wq<CR>

" バッファ移動系
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> [B :blast<CR>
nnoremap <Leader>b :bdelete<CR>

" スプリットウインドウ
nnoremap <silent> ss :split<CR>
nnoremap <silent> sv :vsplit<CR>
nnoremap <silent> sh <C-w>h<CR>
nnoremap <silent> sj <C-w>j<CR>
nnoremap <silent> sk <C-w>k<CR>
nnoremap <silent> sl <C-w>l<CR>

nnoremap <silent> s= <C-w>=<CR>
nnoremap <silent> s> <C-w>><CR>
nnoremap <silent> s< <C-w><<CR>
nnoremap <silent> s+ <C-w>+<CR>
nnoremap <silent> s- <C-w>-<CR>

" タブページ系
nnoremap <silent> st :tabnew<CR>
nnoremap <silent> s] gt<CR>
nnoremap <silent> s[ gT<CR>


" ------------------
"  Unite
" ------------------

let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" Buffers, current directory files, files in subdirectories(all)
" noremap <C-k> :Unite -start-insert buffer file file_rec/async:!<CR>

" show buffer
noremap <C-l> :Unite buffer<CR>

" Most Recently Used Files
noremap <C-z> :Unite file_mru<CR>
noremap <C-n> :Unite file/new<CR>

" Create new file
nnoremap <C-n> :Unite file/new<CR>

" ------------------
"  VimFiler
" ------------------
nnoremap <Leader>v :VimFilerExplorer<CR>



" カーソルキーは使うな
noremap  <up>    <nop>
noremap  <left>  <nop>
noremap  <right> <nop>
noremap  <down>  <nop>
noremap! <up>    <nop>
noremap! <left>  <nop>
noremap! <right> <nop>
noremap! <down>  <nop>

autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none


if !&compatible
  set nocompatible
endif

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}



" プラグイン以外のその他設定が続く
" :  
