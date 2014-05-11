
let s:pairs = ['<TMPL_IF:</TMPL_IF>', '<TMPL_LOOP:</TMPL_LOOP>']

let b:match_words = &matchpairs . ','
\                 . join(s:pairs, ',')

setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

NeoBundleSource zncoding-vim
