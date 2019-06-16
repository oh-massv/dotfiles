"set t_Co=256 "ターミナルで256色表示を使う
set termguicolors

set showmode " 現在のモードを表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する

set noswapfile

"-------画面表示設定-------
set number relativenumber
autocmd InsertEnter * :setlocal norelativenumber
autocmd InsertLeave * :setlocal relativenumber

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

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

"-------動作環境との統合関連の設定-------
set clipboard=unnamed " ヤンクでクリップボードにコピー

" set clipboard=unnamed,autoselect

"-------キー設定-------

" バッファ移動系
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> [B :blast<CR>
nnoremap <Leader>b :bdelete<CR>

nnoremap s <nop>
nnoremap <silent> sh <C-w>h<CR>
nnoremap <silent> sj <C-w>j<CR>
nnoremap <silent> sk <C-w>k<CR>
nnoremap <silent> sl <C-w>l<CR>
nnoremap <silent> sH <C-w>H<CR>
nnoremap <silent> sJ <C-w>J<CR>
nnoremap <silent> sK <C-w>K<CR>
nnoremap <silent> sL <C-w>L<CR>
nnoremap <silent> ss :split<CR>
nnoremap <silent> sv :vsplit<CR>
nnoremap <silent> sw <C-w>w<CR>
nnoremap <silent> sc <C-w>c<CR>
nnoremap <silent> s= <C-w>=<CR>

" タブページ系
nnoremap <silent> st :tabnew<CR>
nnoremap <silent> sn gt<CR>
nnoremap <silent> sp gT<CR>

" カーソルキー
noremap  <up>  <nop>
noremap  <left>  <nop>
noremap  <right> <nop>
noremap  <down>  <nop>
noremap! <up>    <nop>
noremap! <left>  <nop>
noremap! <right> <nop>
noremap! <down>  <nop>
