" plugin settings

" sonictemplate {{{
let g:sonictemplate_vim_template_dir = [
\ printf('%s/dot.vim/templates', expand('<sfile>:h:h'))
\]
" sonictemplate }}}

" operator replace {{{
if globpath(&rtp, 'plugin/operator/replace.vim') != ''
  " operator replace
  nmap R <Plug>(operator-replace)
endif
" operator replace }}}
