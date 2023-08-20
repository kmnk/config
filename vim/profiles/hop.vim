" hop

lua << EOF
require'hop'.setup()
EOF

nmap <Leader>gw <SID>(hop-word)
nmap <Leader>gl <SID>(hop-line)
nmap <Leader>gp <SID>(hop-pattern)
nmap <Leader>gt <SID>(hop-char)
omap <Leader>gw <SID>(hop-word)
omap <Leader>gl <SID>(hop-line)
omap <Leader>gp <SID>(hop-pattern)
omap <Leader>gt <SID>(hop-char)
vmap <Leader>gw <SID>(hop-word)
vmap <Leader>gl <SID>(hop-line)
vmap <Leader>gp <SID>(hop-pattern)
vmap <Leader>gt <SID>(hop-char)

nnoremap <SID>(hop-word) :<C-u>HopWord<CR>
nnoremap <SID>(hop-line) :<C-u>HopLine<CR>
nnoremap <SID>(hop-pattern) :<C-u>HopPattern<CR>
nnoremap <SID>(hop-char) :<C-u>HopChar1<CR>
onoremap <SID>(hop-word) :<C-u>HopWord<CR>
onoremap <SID>(hop-line) :<C-u>HopLine<CR>
onoremap <SID>(hop-pattern) :<C-u>HopPattern<CR>
onoremap <SID>(hop-char) :<C-u>HopChar1<CR>
vnoremap <SID>(hop-word) :<C-u>HopWord<CR>
vnoremap <SID>(hop-line) :<C-u>HopLine<CR>
vnoremap <SID>(hop-pattern) :<C-u>HopPattern<CR>
vnoremap <SID>(hop-char) :<C-u>HopChar1<CR>
