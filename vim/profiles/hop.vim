" hop

lua << EOF
require'hop'.setup()
EOF

nmap <Leader>gw <SID>(hop-word)
nmap <Leader>gl <SID>(hop-line)
nmap <Leader>gp <SID>(hop-pattern)
omap <Leader>gw <SID>(hop-word)
omap <Leader>gl <SID>(hop-line)
omap <Leader>gp <SID>(hop-pattern)

nnoremap <SID>(hop-word) :<C-u>HopWord<CR>
nnoremap <SID>(hop-line) :<C-u>HopLine<CR>
nnoremap <SID>(hop-pattern) :<C-u>HopPattern<CR>
onoremap <SID>(hop-word) :<C-u>HopWord<CR>
onoremap <SID>(hop-line) :<C-u>HopLine<CR>
onoremap <SID>(hop-pattern) :<C-u>HopPattern<CR>
