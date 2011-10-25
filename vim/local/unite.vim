" unite settings
if globpath(&rtp, 'plugin/unite.vim') == ''
  finish
endif

let g:unite_split_rule  = 'botright'

" unite prefix key
nnoremap [unite] <Nop>
nmap <Leader>. [unite]

" maps {{{
nmap [unite]u     <SID>(normally)
nmap [unite]c     <SID>(buffer-dir)
nmap [unite]b     <SID>(buffer)

nmap tt           <SID>(tab)

nmap g*           <SID>(grep)
nmap g.*          <SID>(grep-.)
nmap g..*         <SID>(grep-..)
nmap g...*        <SID>(grep-...)

nmap [unite]o     <SID>(outline)
nmap [unite]m     <SID>(mark)
nmap [unite]r     <SID>(register)

nmap [unite]hc    <SID>(history-command)
nmap [unite]hs    <SID>(history-search)

nmap [unite]<C-h> <SID>(help)

nmap [unite]vst   <SID>(svn-status)
nmap [unite]vdi   <SID>(svn-diff)
nmap [unite]vbl   <SID>(svn-blame)

nmap [unite]s     <SID>(source)

nmap [unite]nbin  <SID>(neobundle-install)
nmap [unite]Nbin  <SID>(neobundle-install-indivisually)
nmap [unite]nbin! <SID>(neobundle-install!)

nmap sc <SID>(color)
"}}}

" mapped commands {{{
" files {{{
nnoremap <SID>(normally)   :<C-u>Unite -buffer-name=files file bookmark file_rec buffer<CR>
nnoremap <SID>(buffer-dir) :<C-u>UniteWithBufferDir -buffer-name=files -prompt=buffer_dir> bookmark file buffer file_rec<CR>
nnoremap <SID>(buffer)     :<C-u>Unite -buffer-name=files -prompt=buffer> buffer<CR>
"}}}

nnoremap <silent> <SID>(tab) :<C-u>Unite -buffer-name=tab -prompt=tab> -immediately -no-start-insert tab<CR>

" grep {{{
let g:unite_source_grep_default_opts = '-iRHn'
nnoremap <silent> <expr> <SID>(grep)     ':Unite grep:' . expand('%:h')     . "<CR>" . expand('<cword>') . "<CR>"
nnoremap <silent> <expr> <SID>(grep-.)   ':Unite grep:' . expand('%:h')     . "<CR>" . expand('<cword>') . "<CR>"
nnoremap <silent> <expr> <SID>(grep-..)  ':Unite grep:' . expand('%:h:h')   . "<CR>" . expand('<cword>') . "<CR>"
nnoremap <silent> <expr> <SID>(grep-...) ':Unite grep:' . expand('%:h:h:h') . "<CR>" . expand('<cword>') . "<CR>"
"}}}

nnoremap <silent> <SID>(outline)  :<C-u>Unite -vertical -direction=topleft -auto-preview outline<CR>
nnoremap <silent> <SID>(mark)     :<C-u>Unite mark<CR>
nnoremap <silent> <SID>(register) :<C-u>Unite register<CR>

" history {{{
nnoremap <silent> <SID>(history-command) :<C-u>Unite history/command<CR>
nnoremap <silent> <SID>(history-search)  :<C-u>Unite history/search<CR>
"}}}

nnoremap <silent> <SID>(help) :<C-u>Unite help<CR>

" svn {{{
nnoremap <silent> <SID>(svn-status) :<C-u>Unite svn/status<CR>
nnoremap <silent> <SID>(svn-diff)   :<C-u>Unite -vertical -direction=topleft -auto-preview svn/diff<CR>
nnoremap <silent> <SID>(svn-blame)  :<C-u>Unite -vertical -direction=topleft svn/blame:<C-r>%<CR>
"}}}

nnoremap <silent> <SID>(source) :<C-u>Unite source<CR>

nnoremap <silent> <SID>(neobundle-install)              :<C-u>Unite neobundle/install<CR>
nnoremap <silent> <SID>(neobundle-install-indivisually) :<C-u>Unite neobundle/install:
nnoremap <silent> <SID>(neobundle-install!)             :<C-u>Unite neobundle/install:!<CR>

nnoremap <silent> <SID>(color) :<C-u>Unite -auto-preview colorscheme<CR>
"}}}


autocmd KmnkAutoCmd FileType unite call s:unite_settings()
function! s:unite_settings()"{{{
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> jj    <Plug>(unite_insert_leave)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  imap <buffer> qq    <Plug>(unite_exit)

  let g:unite_enable_start_insert = 1
endfunction"}}}

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker