" File:    {{_name_}}.vim
" Author:  {{_input_:user-name}} <{{_input_:user-email}}>
" Version: 0.1.0
" License: 

let s:save_cpo = &cpo
set cpo&vim

function! unite#kinds#{{_name_}}#define()"{{{
  return s:kind
endfunction"}}}

let s:kind = {
\ 'name' : '{{_name_}}',
\ 'default_action' : 'run',
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
