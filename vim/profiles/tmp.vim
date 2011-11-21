" tmp

" perl
" sonictemplate設定するまで仮置き
augroup tmp-local "{{{
  autocmd!
  autocmd BufNewFile *.pl 0r ~/.vim/templates/skel.pl
  autocmd BufNewFile *.pm 0r ~/.vim/templates/skel.pm
  autocmd BufNewFile *.tmpl 0r ~/.vim/templates/skel.tmpl
  autocmd BufNewFile *.t 0r ~/.vim/templates/skel.t
augroup END "}}}
