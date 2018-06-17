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

nmap [unite]b <SID>(buffer)
nmap [unite]c <SID>(current_dir_file)
nmap [unite]d <SID>(directory_rec)
nmap [unite]f <SID>(file)
nmap [unite]g <SID>(grep)
nmap [unite]r <SID>(register)

nmap [unite]gst <SID>(git-status)
nmap [unite]gl  <SID>(git-log)
nmap [unite]gL  <SID>(git-log-this-file)
nmap [unite]t   <SID>(sonictemplate)

nnoremap <silent> <SID>(help) :<C-u>Denite help<CR>

nnoremap <silent> <SID>(buffer) :<C-u>Denite buffer<CR>
nnoremap <silent><expr> <SID>(current_dir_file) ':<C-u>Denite -input=' . expand('%:p:h') . ' file file/rec file:new<CR>'
nnoremap <silent><expr> <SID>(directory_rec) ':<C-u>Denite -input=' . expand('%:p:h') . ' directory_rec<CR>'
nnoremap <silent> <SID>(file) :<C-u>Denite file/old file file_mru file/rec<CR>
nnoremap <silent> <SID>(grep) :<C-u>Denite grep<CR>
nnoremap <silent> <SID>(register) :<C-u>Denite register<CR>

nnoremap <silent> <SID>(git-status) :<C-u>Denite gitn_status<CR>
nnoremap <silent> <SID>(git-log) :<C-u>Denite gitn_log<CR>
nnoremap <silent><expr> <SID>(git-log-this-file) ':<C-u>Denite gitn_log:' . expand('%:p') . '<CR>'
nnoremap <silent> <SID>(sonictemplate) :<C-u>Denite sonictemplate<CR>
