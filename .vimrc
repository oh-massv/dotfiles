set encoding=utf-8
scriptencoding utf-8

set t_Co=256 "ターミナルで256色表示を使う

set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する

set noswapfile

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
" set clipboard=unnamed " ヤンクでクリップボードにコピー

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
"nnoremap <silent> ss :split<CR>
"nnoremap <silent> sv :vsplit<CR>
"nnoremap <silent> sh <C-w>h<CR>
"nnoremap <silent> sj <C-w>j<CR>
"nnoremap <silent> sk <C-w>k<CR>
"nnoremap <silent> sl <C-w>l<CR>

nnoremap <silent> s= <C-w>=<CR>
nnoremap <silent> s> <C-w>><CR>
nnoremap <silent> s< <C-w><<CR>
nnoremap <silent> s+ <C-w>+<CR>
nnoremap <silent> s- <C-w>-<CR>

" タブページ系
nnoremap <silent> st :tabnew<CR>
nnoremap <silent> s] gt<CR>
nnoremap <silent> s[ gT<CR>


" show buffer
noremap <C-l> :Unite buffer<CR>

nnoremap <Leader>v :VimFilerExplorer<CR>

noremap  <left>  <nop>
noremap  <right> <nop>
noremap  <down>  <nop>
noremap! <up>    <nop>
noremap! <left>  <nop>
noremap! <right> <nop>
noremap! <down>  <nop>

if &compatible
  set nocompatible
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.vim/dein'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')

" Unite
call dein#add('Shougo/unite.vim')
" To search most recent file using unite
call dein#add('Shougo/neomru.vim')
" To use fuzzy finder vimproc is recomended
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

" File explorer
call dein#add('Shougo/vimfiler.vim')

call dein#add('othree/html5.vim')
call dein#add('othree/html5-syntax.vim')

" call dein#add('Shougo/neocomplete.vim')


"----------------------------------------------------------
" CSS
"----------------------------------------------------------
call dein#add('hail2u/vim-css3-syntax')

"----------------------------------------------------------
" JavaScript
"----------------------------------------------------------
call dein#add('pangloss/vim-javascript')
call dein#add('marijnh/tern_for_vim', {'build': 'npm install'})
call dein#add('othree/yajs.vim')
call dein#add('othree/es.next.syntax.vim')
call dein#add('MaxMEllon/vim-jsx-pretty')
call dein#add('jiangmiao/simple-javascript-indenter')


call dein#add('mattn/emmet-vim')

call dein#add('itchyny/lightline.vim')

call dein#add('Yggdroot/indentLine')

call dein#add('alvan/vim-closetag')


call dein#end()

" install non-installed plugins
if dein#check_install()
  call dein#install()
endif

set background=dark
colorscheme hybrid 

syntax on

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ }
  
