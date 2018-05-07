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
nmap <Space>gr <SID>(git-pull-rebase)
nmap <Space>gl <SID>(git-log-line)
nmap <Space>gL <SID>(git-log)
"}}}

" sonictemplate {{{
let g:sonictemplate_vim_template_dir = [
\ printf('%s/dot.vim/templates', expand('<sfile>:h:h'))
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
  nnoremap       <silent> <SID>(git-pull-rebase)  :<C-u>GitiPullRebase<CR>
  nnoremap                <SID>(git-pull)         :<C-u>GitiPull 
  nnoremap       <silent> <SID>(git-log-line)     :<C-u>GitiLogLine ' . expand('%:p') . '<CR>'
  nnoremap       <silent> <SID>(git-log)          :<C-u>GitiLog ' . expand('%:p') . '<CR>'
endif
" }}}

" yankround {{{
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
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

" Omnisharp {{{
filetype plugin on
let g:OmniSharp_selector_ui = 'unite'
let g:OmniSharp_server_path = '/Users/CJ0061/local/omnisharp/omnisharp/OmniSharp.exe'
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_start_server = 1
let g:OmniSharp_stop_server = 2
let g:OmniSharp_host = "http://localhost:2000"
nnoremap <silent> <buffer> ma :OmniSharpAddToProject<CR>
nnoremap <silent> <buffer> mb :OmniSharpBuild<CR>
nnoremap <silent> <buffer> mc :OmniSharpFindSyntaxErrors<CR>
nnoremap <silent> <buffer> mf :OmniSharpCodeFormat<CR>
nnoremap <silent> <buffer> mj :OmniSharpGotoDefinition<CR>
nnoremap <silent> <buffer> <C-w>mj <C-w>s:OmniSharpGotoDefinition<CR>
nnoremap <silent> <buffer> mi :OmniSharpFindImplementations<CR>
nnoremap <silent> <buffer> mr :OmniSharpRename<CR>
nnoremap <silent> <buffer> mt :OmniSharpTypeLookup<CR>
nnoremap <silent> <buffer> mu :OmniSharpFindUsages<CR>
nnoremap <silent> <buffer> mx :OmniSharpGetCodeActions<CR>
" }}}

" ALE {{{
" エラー行に表示するマーク
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'
" エラー行にカーソルをあわせた際に表示されるメッセージフォーマット
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" エラー表示の列を常時表示
let g:ale_sign_column_always = 1

" ファイルを開いたときにlint実行
let g:ale_lint_on_enter = 1
" ファイルを保存したときにlint実行
let g:ale_lint_on_save = 1
" 編集中のlintはしない
let g:ale_lint_on_text_changed = 'never'

" lint結果をロケーションリストとQuickFixには表示しない
" 出てると結構うざいしQuickFixを書き換えられるのは困る
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

let g:ale_emit_conflict_warnings = 0

" 有効にするlinter
let g:ale_linters = {
\   'python': ['flake8'],
\}

" ALE用プレフィックス
nmap [ale] <Nop>
map <C-k> [ale]
" エラー行にジャンプ
nmap <silent> [ale]<C-P> <Plug>(ale_previous)
nmap <silent> [ale]<C-N> <Plug>(ale_next)

" Compile C# programs with the Unity engine DLL file on Mac.
let g:ale_cs_mcsc_assemblies = [
\ '/Applications/Unity/Unity.app/Contents/Managed/UnityEngine.dll',
\ '/Applications/Unity/Unity.app/Contents/UnityExtensions/Unity/GUISystem/UnityEngine.UI.dll',
\]
" }}}

" gen_tags {{{
let g:gen_tags#ctags_auto_gen = 1
let g:gen_tags#gtags_auto_gen = 1
" }}}

" jedi {{{
" 勝手にキーバインド設定やら自動補完などをやるので潰しておく
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#completions_enabled = 0
" コード参照のキーバインドを登録
let g:jedi#goto_command = "<Leader>d"
" }}}

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
