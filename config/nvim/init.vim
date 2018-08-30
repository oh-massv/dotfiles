set encoding=utf-8
scriptencoding utf-8

if has('nvim') | let $NVIM_TUI_ENABLE_TRUE_COLOR=1 | endif

"autocmd ColorScheme * highlight LineNr ctermbg=none

"let g:python3_host_prog = substitute(system('which python3'),"\n","","")


if has('nvim')
	let g:vim_home = expand('~/.nvim')
	let g:rc_dir = expand('~/.config/nvim/rc')
else
	let g:vim_home = expand('~/.vim')
	let g:rc_dir = expand('~/.vim/rc')
endif

" rcファイル読み込み関数
function! s:source_rc(rc_file_name)
  let rc_file = expand(g:rc_dir . '/' . a:rc_file_name)
  if filereadable(rc_file)
      execute 'source' rc_file
  endif
endfunction

call s:source_rc('dein.rc.vim')
call s:source_rc('options.rc.vim')


autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

set rtp+=/usr/local/opt/fzf
