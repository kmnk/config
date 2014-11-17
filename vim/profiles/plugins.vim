" other plugins

" maps {{{
nmap <Leader>jl <SID>(lint-javascript)

" giti
nmap <Space>gd <SID>(git-diff-cached)
nmap <Space>gD <SID>(git-diff)
nmap <Space>gf <SID>(git-fetch-now)
nmap <Space>gF <SID>(git-fetch)
nmap <Space>gp <SID>(git-push-now)
nmap <Space>gP <SID>(git-pull-now)
nmap <Space>gl <SID>(git-log-line)
nmap <Space>gL <SID>(git-log)
"}}}

" sonictemplate {{{
let g:sonictemplate_vim_template_dirs = [
\ printf('%s/dot.vim/templates/', expand('<sfile>:h:h'))
\]
" }}}

" operator replace setting {{{
if globpath(&rtp, 'plugin/operator/replace.vim') != ''
  " operator replace
  nmap R <Plug>(operator-replace)
endif
"}}}

" textobj settings {{{
if globpath(&rtp, 'autoload/textobj/user.vim') != ''
  " match like hoge::fuga::piyo
  call textobj#user#plugin('dc', {
\   'double_colon': {
\     '*pattern*': '\w\+\(::\w\+\)\+',
\     'select': ['a:', 'i:'],
\   }})

" match like $hoge or @fuga or %piyo
  call textobj#user#plugin('sigil', {
\   'sigil': {
\     '*pattern*': '[$@%]\+[_A-Za-z]\+\w*',
\     'select': ['ag', 'ig'],
\   }})
endif
"}}}

" align settings {{{
if globpath(&rtp, 'plugin/alignta.vim') != ''
  let g:Align_xstrlen=3
  vmap <Leader>al <SID>(setup-align)
  vnoremap <SID>(setup-align) :Alignta
endif
"}}}

" vimfiler settings {{{
if globpath(&rtp, 'plugin/vimfiler.vim') != ''
  nmap <Leader>: <SID>(pop-vimfiler)
  nmap <Space>:  <SID>(launch-vimfiler)
  nmap <Leader>c: <SID>(pop-vimfiler-on-current-buffer-dir)
  nmap <Space>c:  <SID>(launch-vimfiler-on-current-buffer-dir)
  nnoremap <expr> <SID>(pop-vimfiler)    ':<C-u>VimFilerSimple ' . getcwd() . '<CR>'
  nnoremap <expr> <SID>(launch-vimfiler) ':<C-u>VimFiler '       . getcwd() . '<CR>'
  nnoremap <expr> <SID>(pop-vimfiler-on-current-buffer-dir)    ':<C-u>VimFilerSimple ' . expand('%:h') . '<CR>'
  nnoremap <expr> <SID>(launch-vimfiler-on-current-buffer-dir) ':<C-u>VimFiler '    . expand('%:h') . '<CR>'
  call vimfiler#set_execute_file('vim', 'vim')
  call vimfiler#set_execute_file('txt', 'vim')
  call vimfiler#set_execute_file('c', 'vim')

  let g:vimfiler_edit_command = 'edit'
  let g:vimfiler_as_default_explorer = 1

  let g:vimfiler_external_copy_directory_command = 'cp -r $src $dest'
  let g:vimfiler_external_copy_file_command = 'cp $src $dest'
  let g:vimfiler_external_delete_command = 'rm -r $srcs'
  let g:vimfiler_external_move_command = 'mv $srcs $dest'

  " Like Textmate icons.
  let g:vimfiler_tree_leaf_icon = ' '
  let g:vimfiler_tree_opened_icon = '▾'
  let g:vimfiler_tree_closed_icon = '▸'
  let g:vimfiler_file_icon = '-'
  let g:vimfiler_marked_file_icon = '*'
endif
"}}}

" vimshell settings {{{
if globpath(&rtp, 'plugin/vimshell.vim') != ''
  nmap <Leader>;  <SID>(pop-vimshell)
  nmap <Space>;   <SID>(launch-vimshell)
  nmap <Leader>c; <SID>(pop-vimshell-on-current-buffer-dir)
  nmap <Space>c;  <SID>(launch-vimshell-on-current-buffer-dir)
  nnoremap <expr> <SID>(pop-vimshell)    ':<C-u>VimShellPop ' . getcwd() . '<CR>'
  nnoremap <expr> <SID>(launch-vimshell) ':<C-u>VimShell '    . getcwd() . '<CR>'
  nnoremap <expr> <SID>(pop-vimshell-on-current-buffer-dir)    ':<C-u>VimShellPop ' . expand('%:h') . '<CR>'
  nnoremap <expr> <SID>(launch-vimshell-on-current-buffer-dir) ':<C-u>VimShell '    . expand('%:h') . '<CR>'
  let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
  let g:vimshell_enable_smart_case = 1

  if has('win32') || has('win64') 
    " Display user name on Windows.
    let g:vimshell_prompt = $USERNAME."% "
  else
    " Display user name on Linux.
    let g:vimshell_prompt = $USER."% "

    call vimshell#set_execute_file('bmp,jpg,png,gif', 'gexe eog')
    call vimshell#set_execute_file('mp3,m4a,ogg', 'gexe amarok')
    let g:vimshell_execute_file_list['zip'] = 'zipinfo'
    call vimshell#set_execute_file('tgz,gz', 'gzcat')
    call vimshell#set_execute_file('tbz,bz2', 'bzcat')
  endif

  autocmd VimrcAutoCmd FileType vimshell
\   call vimshell#altercmd#define('g', 'git')
\|  nnoremap <buffer> : :
\|  call vimshell#altercmd#define('i', 'iexe')
\|  call vimshell#altercmd#define('l', 'll')
\|  call vimshell#altercmd#define('ll', 'ls -l')
\|  call vimshell#altercmd#define('vi', 'vim')
\|  call vimshell#hook#set('chpwd', ['s:my_chpwd'])
\|  call vimshell#hook#set('emptycmd', ['s:my_emptycmd'])
\|  call vimshell#hook#set('preprompt', ['s:my_preprompt'])
\|  call vimshell#hook#set('preexec', ['s:my_preexec'])
\|  set nonumber

  function! s:my_chpwd(args, context)
    call vimshell#execute('echo "chpwd"')
  endfunction
  function! s:my_emptycmd(cmdline, context)
    call vimshell#execute('echo "emptycmd"')
    return a:cmdline
  endfunction
  function! s:my_preprompt(args, context)
    call vimshell#execute('echo "preprompt"')
  endfunction
  function! s:my_preexec(cmdline, context)
    call vimshell#execute('echo "preexec"')

    let l:args = vimproc#parser#split_args(a:cmdline)
    if len(l:args) > 0 && l:args[0] ==# 'diff'
      call vimshell#set_syntax('diff')
    endif

    return a:cmdline
  endfunction
endif
"}}}

" quickrun settings {{{
if globpath(&rtp, 'plugin/quickrun.vim') != ''
  for [key, com] in items({
\     '<Leader>x' : '>:',
\     '<Leader>p' : '>!',
\     '<Leader>w' : '>',
\     '<Leader>q' : '>>',
\   })
    execute 'nnoremap <silent>' key ':QuickRun' com '-mode n -split vertical<CR>'
    execute 'vnoremap <silent>' key ':QuickRun' com '-mode v -split vertical<CR>'
  endfor
endif
"}}}

" visualstar {{{
map * <Plug>(visualstar-*)N
map # <Plug>(visualstar-#)N
"}}}

" giti {{{
if globpath(&rtp, 'plugin/giti.vim') != ''
  let g:giti_log_default_line_count = 100
  nnoremap <expr><silent> <SID>(git-diff)        ':<C-u>GitiDiff ' . expand('%:p') . '<CR>'
  nnoremap <expr><silent> <SID>(git-diff-cached) ':<C-u>GitiDiffCached ' . expand('%:p') .  '<CR>'
  nnoremap       <silent> <SID>(git-fetch-now)    :<C-u>GitiFetch<CR>
  nnoremap                <SID>(git-fetch)        :<C-u>GitiFetch 
  nnoremap <expr><silent> <SID>(git-push-now)    ':<C-u>GitiPushWithSettingUpstream origin ' . giti#branch#current_name() . '<CR>'
  nnoremap                <SID>(git-push)         :<C-u>GitiPush 
  nnoremap       <silent> <SID>(git-pull-now)     :<C-u>GitiPull<CR>
  nnoremap                <SID>(git-pull)         :<C-u>GitiPull 
  nnoremap       <silent> <SID>(git-log-line)     :<C-u>GitiLogLine ' . expand('%:p') . '<CR>'
  nnoremap       <silent> <SID>(git-log)          :<C-u>GitiLog ' . expand('%:p') . '<CR>'
endif
" }}}

" vim-submode {{{
let g:submode_keep_leaving_key = 1
" winsize
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')

" undo/redo
call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
call submode#map('undo/redo', 'n', '', '-', 'g-')
call submode#map('undo/redo', 'n', '', '+', 'g+')

" tab
call submode#enter_with('tab', 'n', '', 'gt', 'gt')
call submode#enter_with('tab', 'n', '', 'gT', 'gT')
call submode#map('tab', 'n', '', 't', 'gt')
call submode#map('tab', 'n', '', 'T', 'gT')
" }}}

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
