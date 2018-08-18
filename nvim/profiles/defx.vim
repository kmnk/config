if globpath(&rtp, 'plugin/defx.vim') == ''
  finish
endif

nmap <Leader>: <SID>(pop-defx)
nmap <Space>:  <SID>(launch-defx)
nmap <Leader>c: <SID>(pop-defx-on-current-buffer-dir)
nmap <Space>c:  <SID>(launch-defx-on-current-buffer-dir)
nnoremap <expr> <SID>(pop-defx)    ':<C-u>vnew<CR>:Defx ' . getcwd() . '<CR>'
nnoremap <expr> <SID>(launch-defx) ':<C-u>Defx '       . getcwd() . '<CR>'
nnoremap <expr> <SID>(pop-defx-on-current-buffer-dir)    ':<C-u>vnew<CR>:Defx ' . expand('%:h') . '<CR>'
nnoremap <expr> <SID>(launch-defx-on-current-buffer-dir) ':<C-u>Defx '    . expand('%:h') . '<CR>'

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  setlocal nonumber

  nnoremap <silent><buffer><expr> <CR>    defx#do_action('open')
  nnoremap <silent><buffer><expr> l       defx#do_action('open')
  nnoremap <silent><buffer><expr> K       defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N       defx#do_action('new_file')
  nnoremap <silent><buffer><expr> h       defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~       defx#do_action('cd')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> j       line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k       line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer>       qq      :q<CR>
endfunction
