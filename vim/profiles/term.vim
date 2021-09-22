" term
tnoremap <silent> <C-q><C-q> <C-\><C-n>
nmap <Leader>;  <SID>(pop-term)
nmap <Leader>c; <SID>(pop-term-on-current-buffer-dir)

nnoremap <expr> <SID>(pop-term)                       ':<C-u>term<CR>cd "' . getcwd() .      '"<CR><C-l>'
nnoremap <expr> <SID>(pop-term-on-current-buffer-dir) ':<C-u>term<CR>cd "' . expand('%:h') . '"<CR><C-l>'
