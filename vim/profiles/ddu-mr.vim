" dddu-mr

nmap [denite]f <SID>(ddu-mr)

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

call ddu#custom#patch_global({
      \   "sourceOptions": {
      \     "mr": {
      \       "columns": [],
      \     },
      \   },
      \})
