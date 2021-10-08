" ddc

" Customize global settings

" Use around source.
" https://github.com/Shougo/ddc-around
call ddc#custom#patch_global('sources', ['around', 'omni', 'file'])

" Use matcher_head and sorter_rank.
" https://github.com/Shougo/ddc-matcher_head
" https://github.com/Shougo/ddc-sorter_rank
call ddc#custom#patch_global('sourceOptions', {
\ '_': {
\   'matchers': ['matcher_head'],
\   'sorters': ['sorter_rank']
\ },
\ 'around': {'mark': 'A'},
\ 'omni': {'mark': 'O'},
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
