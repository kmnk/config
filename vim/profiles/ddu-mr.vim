" dddu-mr

nmap [denite]f <SID>(ddu-mr)
nmap [denite]c <SID>(ddu-mr-cd)

nnoremap <expr> <SID>(ddu-mr) ':<C-u> call
      \ ddu#start({
      \   "sources": [{"name": "mr"}],
      \   "ui": "filer",
      \   "uiParams": {
      \     "filer": {
      \       "split": "horizontal",
      \       "splitDirection": "botright",
      \       "sort": "time",
      \       "sortTreesFirst": 0,
      \     },
      \   },
      \ })<CR>'

nnoremap <expr> <SID>(ddu-mr-cd) ':<C-u> call
      \ ddu#start({
      \   "sources": [{"name": "mr", "params": {"current": v:true}}],
      \   "ui": "filer",
      \   "uiParams": {
      \     "filer": {
      \       "split": "horizontal",
      \       "splitDirection": "botright",
      \       "sort": "time",
      \       "sortTreesFirst": 0,
      \     },
      \   },
      \ })<CR>'

call ddu#custom#patch_global({
      \   "sourceOptions": {
      \     "mr": {
      \       "columns": [],
      \     },
      \   },
      \})
