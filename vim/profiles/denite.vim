nnoremap [denite] <Nop>
nmap <Leader>. [denite]

nmap <C-h> <SID>(help)
nmap <BS> <SID>(help)

nmap [denite]f <SID>(file)
nmap [denite]c <SID>(current_buffer_dir_file)
nmap [denite]dd <SID>(dirmark)
nmap [denite]da <SID>(dirmark-add)

nnoremap <silent> <SID>(file) :<C-u>Denite file_mru file/old file/rec<CR>

nnoremap <silent> <SID>(help) :<C-u>Denite help<CR>

nnoremap <silent> <SID>(dirmark) :<C-u>Denite -default-action=cd dirmark<CR>
nnoremap <silent><expr> <SID>(dirmark-add) ':<C-u>Denite dirmark/add::"' . expand('%:p:h') .  '"<CR>'

call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('insert', 'kk', '<denite:enter_mode:normal>', 'noremap')
call denite#custom#map('insert', 'qq', '<denite:quit>', 'noremap')
call denite#custom#map('normal', 'a', '<denite:do_action:add>', 'noremap')
call denite#custom#map('normal', 'u', '<denite:do_action:unstage>', 'noremap')
call denite#custom#map('normal', 'yy', '<denite:do_action:yank>', 'noremap')

autocmd FileType denite call s:denite_my_setting()
function! s:denite_my_setting() abort
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')

  nnoremap <silent><buffer><expr> <Tab> denite#do_map('choose_action', '') . denite#do_map('open_filter_buffer')

  nnoremap <silent><buffer><expr> dd denite#do_map('do_action', 'delete')

  nnoremap <silent><buffer><expr> qq denite#do_map('quit')

  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-q> <Plug>(denite_filter_quit)
endfunction
