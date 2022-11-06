" ddu-help

"nnoremap [ddu] <Nop>
"nmap <Leader>. [ddu]

nmap <C-h> <SID>(help)
nmap <BS> <SID>(help)

" {{{
nnoremap <expr> <SID>(help) ':<C-u> call
      \ ddu#start({
      \   "sources": [{"name": "help"}],
      \ })<CR>'
" }}}

call ddu#custom#patch_global({
      \   "sourceOptions": {
      \     "help": {
      \       "columns": [],
      \     },
      \   },
      \   "kindOptions": {
      \     "help": {
      \       "defaultAction": "open",
      \     },
      \   },
      \})
