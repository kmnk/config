" dddu-mr

nmap [denite]f <SID>(ddu-mr)
nmap [denite]c <SID>(ddu-mr-cd)

nnoremap <expr> <SID>(ddu-mr) ':<C-u> call
      \ ddu#start({
      \   "sources": [{"name":"mr", "params": {"kind":"mrw"} }],
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

nnoremap <expr> <SID>(ddu-mr-cd) ':<C-u> call
      \ ddu#start({
      \   "sources": [{"name":"mr", "params": {"kind":"mrw"} }],
      \   "sourceOptions": #{
      \     _: #{
      \       matchers: ["matcher_relative"],
      \     },
      \   },
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
      \       "columns": [],
      \     },
      \   },
      \})
