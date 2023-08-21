" hop

lua << EOF
require'hop'.setup()
EOF

nmap <Leader>gw <SID>(n-hop-word)
nmap <Leader>gl <SID>(n-hop-line)
nmap <Leader>gp <SID>(n-hop-pattern)
nmap <Leader>gt <SID>(n-hop-char)
omap <Leader>gw <SID>(o-hop-word)
omap <Leader>gl <SID>(o-hop-line)
omap <Leader>gp <SID>(o-hop-pattern)
omap <Leader>gt <SID>(o-hop-char)
vmap <Leader>gw <SID>(v-hop-word)
vmap <Leader>gl <SID>(v-hop-line)
vmap <Leader>gp <SID>(v-hop-pattern)
vmap <Leader>gt <SID>(v-hop-char)

nnoremap <SID>(n-hop-word) :<C-u>HopWord<CR>
nnoremap <SID>(n-hop-line) :<C-u>HopLine<CR>
nnoremap <SID>(n-hop-pattern) :<C-u>HopPattern<CR>
nnoremap <SID>(n-hop-char) :<C-u>HopChar1<CR>
onoremap <SID>(o-hop-word) :<C-u>HopWord<CR>
onoremap <SID>(o-hop-line) :<C-u>HopLine<CR>
onoremap <SID>(o-hop-pattern) :<C-u>HopPattern<CR>
onoremap <SID>(o-hop-char) :<C-u>HopChar1<CR>
vnoremap <SID>(v-hop-word) :<C-u>HopWord<CR>
vnoremap <SID>(v-hop-line) :<C-u>HopLine<CR>
vnoremap <SID>(v-hop-pattern) :<C-u>HopPattern<CR>
vnoremap <SID>(v-hop-char) :<C-u>HopChar1<CR>
