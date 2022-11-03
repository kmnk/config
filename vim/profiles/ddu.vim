"nnoremap [ddu] <Nop>
"nmap <Leader>. [ddu]

" You must set the default ui.
" Note: ff ui
" https://github.com/Shougo/ddu-ui-ff
call ddu#custom#patch_global({
      \   'ui': 'ff',
      \})
call ddu#custom#patch_global({
      \   'ui': 'filer',
      \   'sources': [{'name': 'file', 'params': {}}],
      \   'sourceOptions': {
      \     '_': {
      \       'columns': ['filename'],
      \     },
      \     'mr': {
      \       'columns': [],
      \     },
      \   },
      \   'kindOptions': {
      \     'file': {
      \       'defaultAction': 'open',
      \     },
      \   }
      \ })

" You must set the default action.
" Note: file kind
" https://github.com/Shougo/ddu-kind-file
call ddu#custom#patch_global({
      \   'kindOptions': {
      \     'file': {
      \       'defaultAction': 'open',
      \     },
      \     'word': {
      \       'defaultAction': 'append',
      \     },
      \   }
      \ })

" Specify matcher.
" Note: matcher_substring filter
" https://github.com/Shougo/ddu-filter-matcher_substring
call ddu#custom#patch_global({
      \   'sourceOptions': {
      \     '_': {
      \       'matchers': ['matcher_substring'],
      \     },
      \   }
      \ })
call ddu#custom#patch_global({
      \   'filterParams': {
      \     'matcher_substring': {
      \       'highlightMatched': 'Search',
      \     },
      \   }
      \ })

" Set default sources
" Note: file source
" https://github.com/Shougo/ddu-source-file
call ddu#custom#patch_global({
      \ 'sources': [{'name': 'file', 'params': {}}],
      \ })

" Call default sources
"call ddu#startource{})

" Set name specific configuration
call ddu#custom#patch_local('files', {
      \ 'sources': [
      \   {'name': 'file', 'params': {}},
      \   {'name': 'file_old', 'params': {}},
      \ ],
      \ })

" Specify name
"call ddu#start({'name': 'files'})

" Specify source with params
" Note: file_rec source
" https://github.com/Shougo/ddu-source-file_rec
"call ddu#start({'sources': [
"    \ {'name': 'file_rec', 'params': {'path': expand('~')}}
"    \ ]})

" Set kind default action.
call ddu#custom#patch_global({
      \ 'kindOptions': {
      \   'action': {
      \     'defaultAction': 'do',
      \   },
      \   'colorscheme': {
      \     'defaultAction': 'set',
      \   },
      \   'git-log': {
      \     'defaultAction': 'yank',
      \   },
      \ },
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
