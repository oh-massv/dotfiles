vim.cmd [[
  augroup _glsl
    autocmd!
    autocmd BufNewFile,BufRead *.vs,*.fs,*.vert,*.frag set ft=glsl
  augroup end
]]
