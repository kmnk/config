" defx

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

  " Define mappings
  nnoremap <silent><buffer><expr> <CR> defx#do_action('open')
  nnoremap <silent><buffer><expr> c defx#do_action('copy')
  nnoremap <silent><buffer><expr> m defx#do_action('move')
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  nnoremap <silent><buffer><expr> l defx#do_action('open')
  nnoremap <silent><buffer><expr> E defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P defx#do_action('preview')
  nnoremap <silent><buffer><expr> o defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d defx#do_action('remove')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')

  " additional
  nnoremap <silent><buffer><expr> e defx#do_action('open')
endfunction
