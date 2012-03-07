" File:    {{_name_}}.vim
" Author:  {{_input_:user-name}} <{{_input_:user-email}}>
" Version: 0.1.0
" License: 

let s:save_cpo = &cpo
set cpo&vim

function! unite#sources#{{_name_}}#define()"{{{
  return s:source
endfunction"}}}

let s:source = {
\ 'name' : '{{_name_}}',
\ 'description' : '{{_cursor_}}',
\}

function! s:source.gather_candidates(args, context)"{{{
  call unite#print_message('[{{_name_}}]')
  return map([], '{
\   "word"   : v:val,
\   "source" : s:source.name,
\   "kind"   : s:source.name,
\ }')
endfunction"}}}

" local functions {{{
" }}}

let &cpo = s:save_cpo
unlet s:save_cpo
" __END__
