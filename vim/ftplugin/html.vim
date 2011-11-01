
let s:pairs = ['<TMPL_IF:</TMPL_IF>', '<TMPL_LOOP:</TMPL_LOOP>']

let b:match_words = &matchpairs . ','
\                 . join(s:pairs, ',')
