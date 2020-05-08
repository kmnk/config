" Use deoplete.
let g:deoplete#enable_at_startup = 1
" Use smartcase.
call deoplete#custom#option('smart_case', v:true)

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#smart_close_popup()."\<C-h>"

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return deoplete#close_popup() . "\<CR>"
endfunction

if !exists('g:deoplete#omni_patterns')
  let g:deoplete#omni_patterns = {}
endif
let g:deoplete#omni_patterns.cs = '[^.]\.\%(\u\{2,}\)\?'
