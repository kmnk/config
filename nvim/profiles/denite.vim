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

autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')

  nnoremap <silent><buffer><expr> <Tab> denite#do_map('choose_action', '') . denite#do_map('open_filter_buffer')

  nnoremap <silent><buffer><expr> dd denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> pp denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> qq denite#do_map('quit')
  nnoremap <silent><buffer><expr> a denite#do_map('do_action', 'add')
  nnoremap <silent><buffer><expr> u denite#do_map('do_action', 'unstage')
  nnoremap <silent><buffer><expr> yy denite#do_map('do_action', 'yank')

  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')

  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  inoremap <silent><buffer><expr> <C-j>
      \ denite#increment_parent_cursor(1)
  inoremap <silent><buffer><expr> <C-k>
      \ denite#increment_parent_cursor(-1)
  nnoremap <silent><buffer><expr> <C-j>
      \ denite#increment_parent_cursor(1)
  nnoremap <silent><buffer><expr> <C-k>
      \ denite#increment_parent_cursor(-1)
endfunction

nmap <C-h> <SID>(help)
nmap <BS> <SID>(help)

nmap [unite]b <SID>(buffer)
nmap [unite]c <SID>(current_buffer_dir_file)
nmap [unite]C <SID>(current_dir_file)
nmap [unite]d <SID>(directory_rec)
nmap [unite]f <SID>(file)
nmap [unite]g <SID>(grep)
nmap [unite]r <SID>(register)

nmap [unite]gst <SID>(git-status)
nmap [unite]gl  <SID>(git-log)
nmap [unite]gL  <SID>(git-log-this-file)
nmap [unite]t   <SID>(sonictemplate)

nmap [unite]dd    <SID>(dirmark)
nmap [unite]da    <SID>(dirmark-add)

nnoremap <silent> <SID>(help) :<C-u>Denite help<CR>

nnoremap <silent> <SID>(buffer) :<C-u>Denite buffer<CR>
nnoremap <silent><expr> <SID>(current_dir_file) ':<C-u>Denite file file/rec file:new<CR>'
nnoremap <silent><expr> <SID>(current_buffer_dir_file) ':<C-u>Denite file::"' . expand('%:p:h') . '" file::"' . expand('%:p:h:h') . '" file/rec:"' . expand('%:p:h') . '" file:new:"' . expand('%:p:h') . '"<CR>'
nnoremap <silent><expr> <SID>(directory_rec) ':<C-u>Denite directory_rec:"' . expand('%:p:h') . '"<CR>'
nnoremap <silent> <SID>(file) :<C-u>Denite file_mru file/old file/rec<CR>
nnoremap <silent> <SID>(grep) :<C-u>Denite grep<CR>
nnoremap <silent> <SID>(register) :<C-u>Denite register<CR>

nnoremap <silent> <SID>(git-status) :<C-u>Denite gitn_status<CR>
nnoremap <silent> <SID>(git-log) :<C-u>Denite gitn_log<CR>
nnoremap <silent><expr> <SID>(git-log-this-file) ':<C-u>Denite gitn_log:' . expand('%:p') . '<CR>'
nnoremap <silent> <SID>(sonictemplate) :<C-u>Denite sonictemplate<CR>

nnoremap <silent> <SID>(dirmark) :<C-u>Denite -default-action=cd dirmark<CR>
nnoremap <silent><expr> <SID>(dirmark-add) ':<C-u>Denite dirmark/add::"' . expand('%:p:h') .  '"<CR>'
