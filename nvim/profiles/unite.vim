" unite settings
if globpath(&rtp, 'plugin/unite.vim') == ''
  finish
endif

call unite#custom#profile("default", "context", {
\ 'start_insert' : 1,
\ 'direction' : 'botright'
\})
let g:unite_kind_openable_lcd_command = 'lcd'

" unite prefix key
nnoremap [unite] <Nop>
nmap <Leader>. [unite]

" on unite buffer setting
autocmd VimrcAutoCmd FileType unite call s:unite_settings()
function! s:unite_settings()"{{{
  nmap <silent><buffer> : :
  nmap <silent><buffer> <ESC> <Plug>(unite_exit)
  nmap <silent><buffer> i     <Plug>(unite_insert_enter)
  nmap <silent><buffer> I     G<Plug>(unite_insert_head)
  nmap <silent><buffer> A     G<Plug>(unite_insert_head)
  imap <silent><buffer> jj    <Plug>(unite_insert_leave)
  imap <silent><buffer> kk    <Plug>(unite_insert_leave)
  imap <silent><buffer> <C-w> <Plug>(unite_delete_backward_path)
  imap <silent><buffer> qq    <Plug>(unite_exit)
  nmap <silent><buffer><expr> a unite#smart_map('a', unite#do_action('add'))
  vmap <silent><buffer><expr> a unite#smart_map('a', unite#do_action('add'))
  nmap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('add'))
  vmap <silent><buffer><expr> s unite#smart_map('s', unite#do_action('add'))
  nmap <silent><buffer><expr> u unite#smart_map('u', unite#do_action('undo'))
  vmap <silent><buffer><expr> u unite#smart_map('u', unite#do_action('undo'))
  nmap <silent><buffer><expr> U unite#smart_map('U', unite#do_action('checkout'))
  vmap <silent><buffer><expr> U unite#smart_map('U', unite#do_action('checkout'))
  nmap <silent><buffer><expr> c unite#smart_map('c', unite#do_action('commit'))
  vmap <silent><buffer><expr> c unite#smart_map('c', unite#do_action('commit'))
endfunction"}}}

" old
nmap [unite]c <SID>(buffer-dir)
nnoremap <silent> <SID>(buffer-dir) :<C-u>UniteWithBufferDir -buffer-name=files -prompt=buffer_dir> file file_mru buffer_tab file/new<CR>

" maps {{{

nmap [unite]dd    <SID>(bookmark)

nmap tt           <SID>(tab)
nmap TT           <SID>(tab!)

nmap [unite]/     <SID>(search)
nmap [unite]*     <SID>(star-search)

nmap g*           <SID>(grep)
nmap g.*          <SID>(grep-.)
nmap g..*         <SID>(grep-..)
nmap g...*        <SID>(grep-...)
nmap g....*       <SID>(grep-....)

nmap [unite]o     <SID>(outline)
nmap [unite]<C-m> <SID>(mark)

nmap [unite]h:    <SID>(history-command)
nmap [unite]h/    <SID>(history-search)

" giti maps {{{
nmap [unite]gg    <SID>(giti-grep)
nmap [unite]gb    <SID>(git-branch)
nmap [unite]gBa   <SID>(git-branch_all)
nmap [unite]gBr   <SID>(git-branch_recent)
nmap [unite]gc    <SID>(git-config)
nmap [unite]gr    <SID>(git-remote)
" }}}
"}}}

nnoremap <silent> <SID>(bookmark) :<C-u>Unite -default-action=lcd bookmark<CR>

" search {{{
nnoremap <silent> <SID>(search)      :<C-u>Unite -buffer-name=search -prompt=search> -auto-preview -vertical -direction=topleft -no-quit line<CR>
nnoremap <silent> <SID>(star-search) :<C-u>UniteWithCursorWord -buffer-name=search -prompt=search> -auto-preview -vertical -direction=topleft -no-start-insert -no-quit line<CR>
"}}}

" grep {{{
let g:unite_source_grep_default_opts = '-iRHn'
nnoremap <silent> <expr> <SID>(grep)      ':Unite -no-quit grep:' . expand('%:h')       . "<CR>" . expand('<cword>') . "<CR>"
nnoremap <silent> <expr> <SID>(grep-.)    ':Unite -no-quit grep:' . expand('%:h')       . "<CR>" . expand('<cword>') . "<CR>"
nnoremap <silent> <expr> <SID>(grep-..)   ':Unite -no-quit grep:' . expand('%:h:h')     . "<CR>" . expand('<cword>') . "<CR>"
nnoremap <silent> <expr> <SID>(grep-...)  ':Unite -no-quit grep:' . expand('%:h:h:h')   . "<CR>" . expand('<cword>') . "<CR>"
nnoremap <silent> <expr> <SID>(grep-....) ':Unite -no-quit grep:' . expand('%:h:h:h:h') . "<CR>" . expand('<cword>') . "<CR>"
"}}}

nnoremap <silent> <SID>(outline)  :<C-u>Unite -vertical -direction=topleft -auto-preview outline<CR>
nnoremap <silent> <SID>(mark)     :<C-u>Unite mark<CR>

" history {{{
nnoremap <silent> <SID>(history-command) :<C-u>Unite history/command<CR>
nnoremap <silent> <SID>(history-search)  :<C-u>Unite history/search<CR>
"}}}

" git {{{
nnoremap <silent> <SID>(giti-grep)         :<C-u>Unite giti/grep<CR>
nnoremap <silent> <SID>(git-branch)        :<C-u>Unite giti/branch<CR>
nnoremap <silent> <SID>(git-branch_recent) :<C-u>Unite giti/branch_recent<CR>
nnoremap <silent> <SID>(git-branch_all)    :<C-u>Unite giti/branch_all<CR>
nnoremap <silent> <SID>(git-config)        :<C-u>Unite giti/config<CR>
nnoremap <silent> <SID>(git-remote)        :<C-u>Unite giti/remote<CR>
" }}}

" pipe-command {{{
nnoremap <silent> <SID>(pipe-command) :<C-u>Unite pipecommand<CR>
" }}}

nnoremap <silent> <SID>(color) :<C-u>Unite -auto-preview colorscheme<CR>

" immediately actions {{{
nnoremap <silent> <expr> <SID>(immediately-rename) ':<C-u>Unite file -input=' . expand('%:p') . ' -default-action=rename -immediately<CR>'
"}}}
"}}}

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
