" ddc

" Customize global settings

" Use around source.
" https://github.com/Shougo/ddc-around
"call ddc#custom#patch_global('sources', ['around', 'omni', 'file'])
call ddc#custom#patch_global('sources', ['around', 'file'])

" Use matcher_head and sorter_rank.
" https://github.com/Shougo/ddc-matcher_head
" https://github.com/Shougo/ddc-sorter_rank
call ddc#custom#patch_global('sourceOptions', {
\ '_': {
\   'matchers': ['matcher_head'],
\   'sorters': ['sorter_rank']
\ },
\ 'around': {'mark': 'A'},
"\ 'omni': {'mark': 'O'},
\ 'file': {
\   'mark': 'F',
\   'isVolatile': v:true,
\   'forceCompletionPattern': '\S/\S*',
\ }
\})

call ddc#custom#patch_filetype(
    \ ['ps1', 'dosbatch', 'autohotkey', 'registry'], {
    \ 'sourceOptions': {
    \   'file': {
    \     'forceCompletionPattern': '\S\\\S*',
    \   },
    \ },
    \ 'sourceParams': {
    \   'file': {
    \     'mode': 'win32',
    \   },
    \ }})

" Change source options
call ddc#custom#patch_global('sourceParams', {
\ 'around': {'maxSize': 500},
\ 'file': {'smartCase': v:true},
\})

call ddc#custom#patch_global('ui', 'pum')
call ddc#custom#patch_global('autoCompleteEvents', [
\ 'InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged'])
nnoremap :       <Cmd>call CommandlinePre()<CR>q:

function! CommandlinePre() abort
  cnoremap <Tab>   <Cmd>call pum#map#insert_relative(+1)<CR>
  cnoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
  cnoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
  cnoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
  cnoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
  cnoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

  " Overwrite sources
  if !exists('b:prev_buffer_config')
    let b:prev_buffer_config = ddc#custom#get_buffer()
  endif
  "call ddc#custom#patch_buffer('cmdlineSources', ['necovim', 'around'])

  autocmd User DDCCmdlineLeave ++once call CommandlinePost()
  autocmd InsertEnter <buffer> ++once call CommandlinePost()

  " Enable command line completion
  call ddc#enable_cmdline_completion()
endfunction
function! CommandlinePost() abort
  silent! cunmap <Tab>
  silent! cunmap <S-Tab>
  silent! cunmap <C-n>
  silent! cunmap <C-p>
  silent! cunmap <C-y>
  silent! cunmap <C-e>

  " Restore sources
  if exists('b:prev_buffer_config')
    call ddc#custom#set_buffer(b:prev_buffer_config)
    unlet b:prev_buffer_config
  else
    call ddc#custom#set_buffer({})
  endif
endfunction

"call ddc#custom#patch_global('sources', ['nvim-lsp'])
"call ddc#custom#patch_global('sourceOptions', #{
"      \   nvim-lsp: #{
"      \     mark: 'lsp',
"      \     forceCompletionPattern: '\.\w*|:\w*|->\w*' },
"      \ })
"
"" Use Customized labels
"call ddc#custom#patch_global('sourceParams', #{
"      \   nvim-lsp: #{ kindLabels: #{ Class: 'c' } },
"      \ })

" Mappings

" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? '<C-n>' :
      \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
      \ '<TAB>' : ddc#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

" Use ddc.
call ddc#enable()
