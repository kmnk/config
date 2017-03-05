" maps

" terminal
tnoremap <silent> <C-t><C-t> <C-\><C-n>
nmap <Leader>;  <SID>(pop-terminal)
nmap <Space>;   <SID>(launch-terminal)
nmap <Leader>c; <SID>(pop-terminal-on-current-buffer-dir)
nmap <Space>c;  <SID>(launch-terminal-on-current-buffer-dir)
nnoremap <expr> <SID>(pop-terminal)                          ':<C-u>10new<CR>:<C-u>terminal<CR>cd "' . getcwd() .      '"<CR><C-l>'
nnoremap <expr> <SID>(launch-terminal)                                      ':<C-u>terminal<CR>cd "' . getcwd() .      '"<CR><C-l>'
nnoremap <expr> <SID>(pop-terminal-on-current-buffer-dir)    ':<C-u>10new<CR>:<C-u>terminal<CR>cd "' . expand('%:h') . '"<CR><C-l>'
nnoremap <expr> <SID>(launch-terminal-on-current-buffer-dir)                ':<C-u>terminal<CR>cd "' . expand('%:h') . '"<CR><C-l>'

" move buffer
nmap [b <SID>(move-buffer-prev)
nmap ]b <SID>(move-buffer-next)
nmap [B <SID>(move-buffer-first)
nmap ]B <SID>(move-buffer-last)

" split
nmap <Leader>sj <SID>(split-to-j)
nmap <Leader>sk <SID>(split-to-k)
nmap <Leader>sh <SID>(split-to-h)
nmap <Leader>sl <SID>(split-to-l)

nmap gp <SID>(revisual-pasted)

" useful key maps
" redo command by two type
nnoremap c. @:

" substitute current word
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

" in pattern escape
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

" Yank like C and D
nnoremap Y y$

" select latest changes
nnoremap gc `[v`]

" quick write
nnoremap <CR> :<C-u>w<CR>
" quick ZZ
nnoremap <Leader><CR> ZZ

" move buffer {{{
nnoremap <silent> <SID>(move-buffer-prev)  :bprevious<CR>
nnoremap <silent> <SID>(move-buffer-next)  :bnext<CR>
nnoremap <silent> <SID>(move-buffer-first) :bfirst<CR>
nnoremap <silent> <SID>(move-buffer-last)  :blast<CR>
" }}}

" split {{{
nnoremap <SID>(split-to-j) :<C-u>execute 'belowright' (v:count == 0 ? '' : v:count) 'split'<CR>
nnoremap <SID>(split-to-k) :<C-u>execute 'aboveleft'  (v:count == 0 ? '' : v:count) 'split'<CR>
nnoremap <SID>(split-to-h) :<C-u>execute 'topleft'    (v:count == 0 ? '' : v:count) 'vsplit'<CR>
nnoremap <SID>(split-to-l) :<C-u>execute 'botright'   (v:count == 0 ? '' : v:count) 'vsplit'<CR>
"}}}

"
nnoremap <expr> <SID>(revisual-pasted) '`[' . strpart(getregtype(), 0, 1) . '`]'

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
