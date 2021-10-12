" phpactor

nmap <Leader>pgd <SID>(go-to-definition)
nmap <leader>pp <SID>(hover)
nmap <Leader>pcm <SID>(context-menu)
nmap <Leader>pt <SID>(transform)

" {{{
nnoremap <SID>(go-to-definition) :<C-u>PhpactorGotoDefinition<CR>
nnoremap <SID>(hover) :<C-u>PhpactorHover<CR>
nnoremap <SID>(transform) :<C-u>PhpactorTransform<CR>
nnoremap <SID>(context-menu) :<C-u>PhpactorContextMenu<CR>
" }}}

autocmd FileType php setlocal omnifunc=phpactor#Complete

