
let g:lightline = {
\ 'colorscheme': 'solarized_dark',
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
