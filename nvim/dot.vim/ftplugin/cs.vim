nmap <Leader><Leader>d <SID>(insert-debugger)
nmap <Leader><Leader>D <SID>(insert-debugger-with-register)
nmap <Leader><Leader>cv <SID>(insert-variable-comment)

nnoremap <SID>(insert-debugger)               oDebug.Log();<ESC>h
nnoremap <SID>(insert-debugger-with-register) oDebug.Log(<C-R>");<ESC>
nnoremap <SID>(insert-variable-comment) O/// <summary></summary><ESC>9hi

set noexpandtab
