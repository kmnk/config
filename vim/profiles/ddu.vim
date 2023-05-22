"nnoremap [ddu] <Nop>
"nmap <Leader>. [ddu]

call ddu#custom#patch_global({'ui': 'ff'})
call ddu#custom#patch_global({
      \   'sources': [
      \   ]
      \})
call ddu#custom#patch_global({
      \   'sourceOptions': {
      \     '_': {
      \       'matchers': ['matcher_substring'],
      \     },
      \   },
      \})
call ddu#custom#patch_global({
      \   'kindOptions': {
      \     'word': {
      \       'defaultAction': 'append',
      \     },
      \     'action': {
      \       'defaultAction': 'do',
      \     },
      \     'colorscheme': {
      \       'defaultAction': 'set',
      \     },
      \     'git-log': {
      \       'defaultAction': 'yank',
      \     },
      \     'custom-list': {
      \       'defaultAction': 'callback',
      \     },
      \   },
      \})
call ddu#custom#patch_global({
      \   'filterParams': {
      \     'matcher_substring': {
      \       'highlightMatched': 'Search',
      \     },
      \   },
      \})

autocmd FileType ddu-ff call s:ddu_my_settings()
function! s:ddu_my_settings() abort
  nnoremap <buffer><silent> <CR>
        \ <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  nnoremap <buffer><silent> <Tab>
        \ <Cmd>call ddu#ui#ff#do_action('chooseAction')<CR>
  nnoremap <buffer><silent> <Space>
        \ <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
  nnoremap <buffer><silent> i
        \ <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> q
        \ <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
function! s:ddu_filter_my_settings() abort
  inoremap <buffer><silent> <CR>
        \ <Esc><Cmd>close<CR>
  nnoremap <buffer><silent> <CR>
        \ <Cmd>close<CR>
  nnoremap <buffer><silent> q
        \ <Cmd>close<CR>
endfunction
