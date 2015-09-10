setlocal autoindent
setlocal expandtab
setlocal softtabstop=2
setlocal shiftwidth=2

setlocal indentkeys=0{,0},:,0#,!^F,o,O,e,=end,=else,=cat,=fina,=END

let b:undo_indent = 'setlocal '. join([
\   'autoindent<',
\   'expandtab<',
\   'softtabstop<',
\   'shiftwidth<',
\   'indentkeys<',
\ ])
