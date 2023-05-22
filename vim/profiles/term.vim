" term

tnoremap <silent> <C-q><C-q> <C-\><C-n>
nmap <Leader>;  <SID>(pop-term)
nmap <Leader>c; <SID>(pop-term-on-current-buffer-dir)

if has('nvim')
  nnoremap <expr> <SID>(pop-term)                       ':<C-u>new term://zsh<CR>icd "' . getcwd() .      '"<CR><C-l>'
  nnoremap <expr> <SID>(pop-term-on-current-buffer-dir) ':<C-u>new term://zsh<CR>icd "' . expand('%:h') . '"<CR><C-l>'
else
  nnoremap <expr> <SID>(pop-term)                       ':<C-u>term<CR>cd "' . getcwd() .      '"<CR><C-l>'
  nnoremap <expr> <SID>(pop-term-on-current-buffer-dir) ':<C-u>term<CR>cd "' . expand('%:h') . '"<CR><C-l>'
endif
