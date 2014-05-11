nmap <Leader>db <SID>(insert-debugger)
nmap <Leader>dB <SID>(insert-debugger-with-register)

nnoremap <SID>(insert-debugger)               oDebug.Log();<ESC>h
nnoremap <SID>(insert-debugger-with-register) oDebug.Log(<C-R>");<ESC>
