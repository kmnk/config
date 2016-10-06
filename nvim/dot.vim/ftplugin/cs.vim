nmap <Leader><Leader>d <SID>(insert-debugger)
nmap <Leader><Leader>D <SID>(insert-debugger-with-register)
nmap <Leader><Leader>cv <SID>(insert-variable-comment)

nnoremap <SID>(insert-debugger)               oDebug.Log();<ESC>h
nnoremap <SID>(insert-debugger-with-register) oDebug.Log(<C-R>");<ESC>
nnoremap <SID>(insert-variable-comment) O/// <summary></summary><ESC>9hi

nnoremap <silent> <buffer> ma :OmniSharpAddToProject<CR>
nnoremap <silent> <buffer> mb :OmniSharpBuild<CR>
nnoremap <silent> <buffer> mc :OmniSharpFindSyntaxErrors<CR>
nnoremap <silent> <buffer> mf :OmniSharpCodeFormat<CR>
nnoremap <silent> <buffer> mj :OmniSharpGotoDefinition<CR>
nnoremap <silent> <buffer> <C-w>mj <C-w>s:OmniSharpGotoDefinition<CR>
nnoremap <silent> <buffer> mi :OmniSharpFindImplementations<CR>
nnoremap <silent> <buffer> mr :OmniSharpRename<CR>
nnoremap <silent> <buffer> mt :OmniSharpTypeLookup<CR>
nnoremap <silent> <buffer> mu :OmniSharpFindUsages<CR>
nnoremap <silent> <buffer> mx :OmniSharpGetCodeActions<CR>
