" TODO: 全部移行したら denite にする
"nnoremap [denite] <Nop>
"nmap <Leader>. [denite]

call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('insert', 'kk', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('insert', 'qq', '<denite:quit>', 'noremap')

call denite#custom#map('normal', 'a', '<denite:do_action:add>', 'noremap')
call denite#custom#map('normal', 'u', '<denite:do_action:unstage>', 'noremap')
call denite#custom#map('normal', 'yy', '<denite:do_action:yank>', 'noremap')

nmap <C-h> <SID>(help)
nmap <BS> <SID>(help)
nmap [unite]gst   <SID>(git-status)
nmap [unite]gl   <SID>(git-log)
nmap [unite]gL   <SID>(git-log-this-file)

nnoremap <silent> <SID>(help) :<C-u>Denite help<CR>
nnoremap <silent> <SID>(git-status) :<C-u>Denite gitn:status<CR>
nnoremap <silent> <SID>(git-log) :<C-u>Denite gitn:log<CR>
nnoremap <silent><expr> <SID>(git-log-this-file) ':<C-u>Denite gitn:log:' . expand('%:p') . '<CR>'
