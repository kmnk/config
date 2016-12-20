
nmap <C-h> <SID>(help)
nmap <BS> <SID>(help)

nnoremap <silent> <SID>(help) :<C-u>Denite help<CR>

call denite#custom#map(
\ 'insert',
\ '<C-j>',
\ '<denite:move_to_next_line>',
\ 'noremap'
\)
call denite#custom#map(
\ 'insert',
\ '<C-k>',
\ '<denite:move_to_previous_line>',
\ 'noremap'
\)
call denite#custom#map(
\ 'insert',
\ '<C-k>',
\ '<denite:move_to_previous_line>',
\ 'noremap'
\)

call denite#custom#map(
\ 'normal',
\ 'a',
\ '<denite:do_action:add>',
\ 'noremap'
\)
call denite#custom#map(
\ 'normal',
\ 'a',
\ '<denite:do_action:undo>',
\ 'noremap'
\)
call denite#custom#map(
\ 'normal',
\ 'd',
\ '<denite:do_action:delete>',
\ 'noremap'
\)
