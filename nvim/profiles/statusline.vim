
let g:lightline = {
\ 'colorscheme': 'solarized',
\ 'active': {
\   'left': [ ['mode', 'paste'],
\             ['readonly', 'filename', 'modified'] ],
\   'right': [ ['syntastic', 'lineinfo'],
\              ['percent'],
\              ['fileformat', 'fileencoding', 'filetype'] ]
\ },
\ 'inactive': {
\   'left': [ ['filename'] ],
\   'right': [ ['lineinfo'],
\              ['percent'] ]
\ },
\ 'tabline': {
\   'left': [ ['tabs'] ],
\   'right': [ ['close'] ]
\ },
\ 'tab': {
\   'active': ['tabnum', 'filename', 'modified'],
\   'inactive': ['tabnum', 'filename', 'modified']
\ },
\ 'separator': { 'left': '⮀', 'right': '⮂' },
\ 'subseparator': { 'left': '⮁', 'right': '⮃' },
\ 'component': {
\   'readonly': '%{&readonly?"⭤":""}',
\ },
\ 'component_function': {
\   'filename': 'LightLineFileName'
\ },
\ 'component_expand': {
\   'syntastic': 'SyntasticStatuslineFlag'
\ },
\ 'component_type': {
\   'syntastic': 'error'
\ },
\}

let g:lightline.mode_map = {
\ 'n' : 'N',
\ 'i' : 'I',
\ 'R' : 'R',
\ 'v' : 'V',
\ 'V' : 'V-L',
\ "\<C-v>": 'V-B',
\ 'c' : 'C',
\ 's' : 'S',
\ 'S' : 'S-L',
\ "\<C-s>": 'S-B',
\ 't': 'T',
\ }

function! LightLineFileName()
  return &ft == 'vimfiler'   ? 'VimFiler'
\      : &ft == 'vimshell'   ? 'VimShell'
\      : '' != expand('%:t') ? ( winwidth(0) > 90 ? expand('%') : expand('%:t') )
\      :                       '[No Name]'
endfunction

let g:syntastic_mode_map = { 'mode': 'passive' }
autocmd VimrcAutoCmd BufWritePost *.cs,*.c,*.cpp call s:syntastic()
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction
