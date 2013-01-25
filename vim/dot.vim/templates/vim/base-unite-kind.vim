" File:    {{_name_}}.vim
" Author:  {{_input_:user-name}} <{{_input_:user-email}}>
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

function! unite#kinds#{{_name_}}#define()"{{{
  return s:kind
endfunction"}}}

let s:kind = {
\ 'name' : '{{_name_}}',
\ 'default_action' : 'default',
\ 'action_table' : {},
\ 'alias_table' : {},
\}

let s:kind.action_table.run = {
\ 'description' : 'run {{_name_}}',
\ 'is_selectable' : 0,
\ 'is_quit' : 1,
\ 'is_invalidate_cache' : 0,
\ 'is_listed' : 1,
\}
function! s:kind.action_table.run.func(candidate)"{{{
  " call some functions
endfunction"}}}
let s:kind.alias_table.default = 'run'

" local functions {{{
" }}}

let &cpo = s:save_cpo
unlet s:save_cpo
" __END__
