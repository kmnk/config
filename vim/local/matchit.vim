" matchit
runtime macros/matchit.vim

let b:match_words = &matchpairs . ','
\                 . '<TMPL_IF:</TMPL_IF>,'
\                 . '<TMPL_LOOP:</TMPL_LOOP>,'
