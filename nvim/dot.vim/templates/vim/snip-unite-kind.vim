let s:kind.action_table.{{_input_:action-name}} = {
\ 'description' : '{{_cursor_}}',
\ 'is_selectable' : 0,
\ 'is_quit' : 1,
\ 'is_invalidate_cache' : 0,
\ 'is_listed' : 1,
\}
function! s:kind.action_table.{{_input_:action-name}}.func(candidate)"{{{
  " call some functions
endfunction"}}}
"let s:kind.alias_table.alias_action = '{{_input_:action-name}}'
