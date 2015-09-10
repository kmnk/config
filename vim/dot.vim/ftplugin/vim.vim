setlocal foldmethod=marker

let b:undo_indent = 'setlocal '. join([
\   'foldmethod<',
\ ])

NeoBundleSource vim-prettyprint
