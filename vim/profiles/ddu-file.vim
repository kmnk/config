" ddu-file

nmap <Leader>: <SID>(start-ddu-file-vertical)
nmap <Leader>c: <SID>(start-ddu-file-current-vertical)
nmap <Leader>f: <SID>(start-ddu-file_rec-vertical)

" {{{
nnoremap <expr> <SID>(start-ddu-file-vertical) ':<C-u> call
      \ ddu#start(
      \   {
      \     "sources":[{"name":"file"}],
      \     "ui":"filer",
      \     "uiParams":{"filer":{"split":"vertical", "splitDirection":"topleft", "sort":"filename", "sortTreesFirst":1}},
      \   }
      \ )<CR><CR>'
nnoremap <expr> <SID>(start-ddu-file-current-vertical) ':<C-u> call
      \ ddu#start(
      \   {
      \     "sources":[{"name":"file"}],
      \     "sourceOptions":{"file":{"path":expand("%:p:h")}},
      \     "ui":"filer",
      \     "uiParams":{"filer":{"split":"vertical", "splitDirection":"topleft", "sort":"filename", "sortTreesFirst":1}},
      \   }
      \ )<CR><CR>'
nnoremap <expr> <SID>(start-ddu-file_rec-vertical) ':<C-u> call
      \ ddu#start(
      \   {
      \     "sources":[{"name":"file_rec"}, {"name":"file_old"}],
      \     "ui":"filer",
      \     "uiParams":{"filer":{"split":"vertical", "splitDirection":"topleft", "sort":"filename", "sortTreesFirst":1}},
      \   }
      \ )<CR><CR>'
" }}}

autocmd FileType ddu-filer call s:ddu_my_settings()
function! s:ddu_my_settings() abort
  nnoremap <buffer><expr> <CR>
        \ ddu#ui#get_item()->get('isTree', v:false)
        \   ? "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow'})<CR>"
        \   : "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open'})<CR>"
  nnoremap <buffer><expr> l
        \ ddu#ui#get_item()->get('isTree', v:false)
        \   ? "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow'})<CR>"
        \   : "<Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open'})<CR>"
  nnoremap <buffer> h
        \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow', 'params': {'path': '..'}})<CR>
  nnoremap <buffer> ~
        \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'narrow', 'params': {'path': expand('~')}})<CR>
  nnoremap <buffer> cc
        \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'cd'})<CR>
  nnoremap <buffer> dd
        \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'delete'})<CR>
  nnoremap <buffer> yy
        \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'yank'})<CR>
  nnoremap <buffer> p
        \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'paste'})<CR>
  nnoremap <buffer> rr
        \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'rename'})<CR>
  nnoremap <buffer> tt
        \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open', 'params': {'command': 'tabedit'}})<CR>
  nnoremap <buffer> vv
        \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open', 'params': {'command': 'vsplit'}})<CR>
  nnoremap <buffer> ss
        \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'open', 'params': {'command': 'split'}})<CR>
  nnoremap <buffer> N
        \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newFile'})<CR>
  nnoremap <buffer> K
        \ <Cmd>call ddu#ui#filer#do_action('itemAction', {'name': 'newDirectory'})<CR>
  nnoremap <buffer><silent> c
        \ <Cmd>call ddu#ui#filer#multi_actions([
        \   ['itemAction', {'name': 'copy'}],
        \   ['clearSelectAllItems'],
        \ ])<CR>
  nnoremap <buffer><silent> <Space>
        \ <Cmd>call ddu#ui#filer#do_action('toggleSelectItem')<CR>
  nnoremap <buffer> o
        \ <Cmd>call ddu#ui#filer#do_action('expandItem', {'mode': 'toggle'})<CR> " not work
  nnoremap <buffer><silent> qq
        \ <Cmd>call ddu#ui#filer#do_action('quit')<CR>
  nnoremap <buffer><silent> .
        \ <Cmd>call ddu#ui#filer#do_action('updateOptions', {
        \   'sourceOptions': {
        \     '_': {
        \       'matchers': ToggleHidden(),
        \     },
        \   },
        \ })<CR>
  nnoremap <buffer><silent> <C-l>
        \ <Cmd>call ddu#ui#filer#do_action('checkItems')<CR>
endfunction

function! ToggleHidden()
  let current = ddu#custom#get_current(b:ddu_ui_name)
  let source_options = get(current, 'sourceOptions', {})
  let source_options_all = get(source_options, '_', {})
  let matchers = get(source_options_all, 'matchers', [])
  return empty(matchers) ? ['matcher_hidden'] : []
endfunction

call ddu#custom#patch_global({
      \   'sources': [
      \     {'name': 'file', 'params': {}},
      \     {'name': 'file_old', 'params': {}},
      \   ],
      \   'sourceOptions': {
      \     'file': {
      \       'matchers': ['matcher_substring'],
      \       'columns': ['filename'],
      \     },
      \   },
      \   'kindOptions': {
      \     'file': {
      \       'defaultAction': 'open',
      \     },
      \   },
      \})
