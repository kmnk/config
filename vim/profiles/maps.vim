" maps

map <C-j> <SID>(to-next-tab)
map <C-k> <SID>(to-prev-tab)

nmap <Leader>sj <SID>(split-to-j)
nmap <Leader>sk <SID>(split-to-k)
nmap <Leader>sh <SID>(split-to-h)
nmap <Leader>sl <SID>(split-to-l)

nmap <Leader>jl <SID>(lint-javascript)

nmap gp <SID>(re-visual-pasted)

" useful key maps
" redo command by two type
nnoremap c. @:

" * on visualmode 
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" substitute current word
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

" in pattern escape
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

" Yank like C and D
nnoremap Y y$

" select latest changes
nnoremap gc `[v`]

" 
nnoremap ; :<C-u>w<CR>

" move tab
nnoremap <SID>(to-next-tab) gt
nnoremap <SID>(to-prev-tab) gT

" split {{{
nnoremap <SID>(split-to-j) :<C-u>execute 'belowright' (v:count == 0 ? '' : v:count) 'split'<CR>
nnoremap <SID>(split-to-k) :<C-u>execute 'aboveleft'  (v:count == 0 ? '' : v:count) 'split'<CR>
nnoremap <SID>(split-to-h) :<C-u>execute 'topleft'    (v:count == 0 ? '' : v:count) 'vsplit'<CR>
nnoremap <SID>(split-to-l) :<C-u>execute 'botright'   (v:count == 0 ? '' : v:count) 'vsplit'<CR>
"}}}
"

" jslint {{{
nnoremap <silent> <SID>(lint-javascript) :<C-u>JSLintUpdate<CR>
" }}}

"
nnoremap <expr> <SID>(re-visual-pasted) '`[' . strpart(getregtype(), 0, 1) . '`]'

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
