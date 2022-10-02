" dddu-mr

nmap [denite]f <SID>(ddu-mr)

nnoremap <expr> <SID>(ddu-mr) ':<C-u> call
      \ ddu#start(
      \   {
      \     "sources":[{"name":"mr"}]
      \   }
      \ )<CR>'
