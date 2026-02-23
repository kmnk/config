"nnoremap [ddu] <Nop>
"nmap <Leader>. [ddu]

"nmap [ddu]dd <SID>(dirmark)
"nmap [ddu]dg <SID>(dirmark-groups)
"nmap [ddu]da <SID>(dirmark-add)
"
"nmap [ddu]l <SID>(cmdl)
"
"" {{{
"nnoremap <silent> <SID>(file) :<C-u>Denite file_mru file/old<CR>
"
"nnoremap <silent> <SID>(dirmark) :<C-u>Denite -default-action=cd dirmark<CR>
"nnoremap <silent> <SID>(dirmark-groups) :<C-u>Denite dirmark/groups:cd<CR>
"nnoremap <silent><expr> <SID>(dirmark-add) ':<C-u>Denite dirmark/add::"' . expand('%:p:h') .  '"<CR>'
"
"nnoremap <silent> <SID>(cmdl) :<C-u>Denite cmdl<CR>
"" }}}
"
"call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>', 'noremap')
"call denite#custom#map('insert', 'kk', '<denite:enter_mode:normal>', 'noremap')
"call denite#custom#map('insert', 'qq', '<denite:quit>', 'noremap')
"call denite#custom#map('normal', 'a', '<denite:do_action:add>', 'noremap')
"call denite#custom#map('normal', 'u', '<denite:do_action:unstage>', 'noremap')
"call denite#custom#map('normal', 'yy', '<denite:do_action:yank>', 'noremap')
"
"autocmd FileType denite call s:denite_my_setting()
"function! s:denite_my_setting() abort
"  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
"
"  nnoremap <silent><buffer><expr> <Tab> denite#do_map('choose_action', '') . denite#do_map('open_filter_buffer')
"
"  nnoremap <silent><buffer><expr> dd denite#do_map('do_action', 'delete')
"  nnoremap <silent><buffer><expr> qq denite#do_map('quit')
"  nnoremap <silent><buffer><expr> a denite#do_map('do_action', 'add')
"  nnoremap <silent><buffer><expr> u denite#do_map('do_action', 'unstage')
"  nnoremap <silent><buffer><expr> yy denite#do_map('do_action', 'yank')
"
"  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
"
"  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
"endfunction
"
"autocmd FileType denite-filter call s:denite_filter_my_settings()
"function! s:denite_filter_my_settings() abort
"  imap <silent><buffer> <C-q> <Plug>(denite_filter_quit)
"endfunction
