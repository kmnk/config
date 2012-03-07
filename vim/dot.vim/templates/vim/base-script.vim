" File:    {{_name_}}.vim
" Author:  {{_input_:user-name}} <{{_input_:user-email}}>
" Version: 0.1.0
" License: 

let s:save_cpo = &cpo
set cpo&vim

{{_cursor_}}


let &cpo = s:save_cpo
unlet s:save_cpo
" __END__
