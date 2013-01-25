" File:    {{_name_}}.vim
" Author:  {{_input_:user-name}} <{{_input_:user-email}}>
" Version: 0.1.0
" Copyright: Copyright (C) 2013- {{_name_}}
" License: MIT Licence {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"     The above copyright notice and this permission notice shall be
"     included in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
"     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}

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
