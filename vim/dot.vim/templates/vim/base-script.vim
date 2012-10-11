" File:    {{_name_}}.vim
" Author:  {{_input_:user-name}} <{{_input_:user-email}}>
" Version: 0.1.0
" License: MIT Licence

let s:save_cpo = &cpo
set cpo&vim

" variables {{{
" }}}

{{_cursor_}}




" local functions {{{
" }}}


let &cpo = s:save_cpo
unlet s:save_cpo
" __END__
