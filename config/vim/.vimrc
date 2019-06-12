set termguicolors

set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する

set number         " 行番号を表示する
set relativenumber
set cursorline     " カーソル行の背景色を変える

set clipboard=unnamed " ヤンクでクリップボードにコピー

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


call plug#begin('~/.vim/plugged')
" Install ansible plugin 
" Make vim pretty with nova-vim
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasr/molokai'
call plug#end()

color molokai
highlight Normal ctermbg=none
