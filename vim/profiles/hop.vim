" hop

lua << EOF
require'hop'.setup()
EOF

nmap <Leader>gw <SID>(n-hop-word)
nmap <Leader>gl <SID>(n-hop-line)
nmap <Leader>gp <SID>(n-hop-pattern)
omap <Leader>gw <SID>(o-hop-word)
omap <Leader>gl <SID>(o-hop-line)
omap <Leader>gp <SID>(o-hop-pattern)
vmap <Leader>gw <SID>(v-hop-word)
vmap <Leader>gl <SID>(v-hop-line)
vmap <Leader>gp <SID>(v-hop-pattern)

nnoremap <SID>(n-hop-word) :<C-u>HopWord<CR>
nnoremap <SID>(n-hop-line) :<C-u>HopLine<CR>
nnoremap <SID>(n-hop-pattern) :<C-u>HopPattern<CR>
onoremap <SID>(o-hop-word) :<C-u>HopWord<CR>
onoremap <SID>(o-hop-line) :<C-u>HopLine<CR>
onoremap <SID>(o-hop-pattern) :<C-u>HopPattern<CR>
vnoremap <SID>(v-hop-word) :<C-u>HopWord<CR>
vnoremap <SID>(v-hop-line) :<C-u>HopLine<CR>
vnoremap <SID>(v-hop-pattern) :<C-u>HopPattern<CR>
