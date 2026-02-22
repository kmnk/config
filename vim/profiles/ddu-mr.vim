" ddu-mr

nmap [ddu]c <SID>(ddu-mr-cd)

nnoremap <expr> <SID>(ddu-mr-cd) ':<C-u> call
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
      \ })<CR><CR>'

call ddu#custom#patch_global({
      \   "sourceOptions": {
      \     "mr": {
      \       "matchers": ["matcher_relative", "matcher_substring"],
      \     },
      \   },
      \})
