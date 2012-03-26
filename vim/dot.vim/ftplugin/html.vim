
let s:pairs = ['<TMPL_IF:</TMPL_IF>', '<TMPL_LOOP:</TMPL_LOOP>']

let b:match_words = &matchpairs . ','
\                 . join(s:pairs, ',')

set expandtab
set softtabstop=2
set shiftwidth=2
