" unite settings
if globpath(&rtp, 'plugin/unite.vim') == ''
  finish
endif

let g:unite_split_rule = 'botright'
let g:unite_enable_start_insert = 1

" unite prefix key
nnoremap [unite] <Nop>
nmap <Leader>. [unite]

" on unite buffer setting
autocmd VimrcAutoCmd FileType unite call s:unite_settings()
function! s:unite_settings()"{{{
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> jj    <Plug>(unite_insert_leave)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  imap <buffer> qq    <Plug>(unite_exit)
endfunction"}}}

" maps {{{
nmap [unite]u     <SID>(normally)
nmap [unite]c     <SID>(buffer-dir)
nmap [unite]C     <SID>(buffer-file)
nmap [unite]b     <SID>(buffer)
nmap [unite]ab    <SID>(all-buffer)

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
nmap [unite]r     <SID>(register)

nmap [unite]hc    <SID>(history-command)
nmap [unite]hs    <SID>(history-search)

nmap [unite]<C-h> <SID>(help)

nmap [unite]vst   <SID>(svn-status)
nmap [unite]vdi   <SID>(svn-diff)
nmap [unite]vbl   <SID>(svn-blame)

nmap [unite]gg    <SID>(giti-sources)
nmap [unite]gst   <SID>(git-status)
nmap [unite]gb    <SID>(git-branch)
nmap [unite]gc    <SID>(git-config)
nmap [unite]gl    <SID>(git-log)
nmap [unite]gL    <SID>(git-log-this-file)

nmap [unite]s     <SID>(source)

nmap [unite]nb    <SID>(neobundle)
nmap [unite]Nb    <SID>(neobundle-update)

nmap [unite]frn   <SID>(immediately-rename)

nmap [unite]t <SID>(sonictemplate)

nmap sc <SID>(color)
"}}}

" mapped commands {{{
" files {{{
nnoremap <silent>        <SID>(normally)     :<C-u>Unite -buffer-name=files file file_rec file_mru buffer_tab file/new<CR>
nnoremap <silent>        <SID>(buffer-dir)   :<C-u>UniteWithBufferDir -buffer-name=files -prompt=buffer_dir> file file_rec file_mru buffer_tab file/new<CR>
nnoremap <silent> <expr> <SID>(buffer-file) ':<C-u>UniteWithBufferDir -buffer-name=files -prompt=buffer_dir> -input=' . expand('%:p') . ' file file_rec file_mru buffer_tab file/new<CR>'
nnoremap <silent>        <SID>(buffer)       :<C-u>Unite -buffer-name=files -prompt=buffer> buffer_tab file_mru file/new<CR>
nnoremap <silent>        <SID>(all-buffer)   :<C-u>Unite -buffer-name=files -prompt=buffer> buffer file_mru file/new<CR>
"}}}

" search {{{
nnoremap <silent> <SID>(search)      :<C-u>Unite -buffer-name=search -prompt=search> -auto-preview -vertical -direction=topleft -no-quit line<CR>
nnoremap <silent> <SID>(star-search) :<C-u>UniteWithCursorWord -buffer-name=search -prompt=search> -auto-preview -vertical -direction=topleft -no-start-insert -no-quit line<CR>
"}}}

nnoremap <silent> <SID>(tab)  :<C-u>Unite -buffer-name=tab -prompt=tab> -immediately -no-start-insert tab:no-current<CR>
nnoremap <silent> <SID>(tab!) :<C-u>Unite -buffer-name=tab -prompt=tab> tab<CR>

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
" }}}

" git {{{
nnoremap <silent> <SID>(giti-sources) :<C-u>Unite giti<CR>
nnoremap <silent> <SID>(git-status)   :<C-u>Unite giti/status<CR>
nnoremap <silent> <SID>(git-branch)   :<C-u>Unite giti/branch<CR>
nnoremap <silent> <SID>(git-config)   :<C-u>Unite giti/config<CR>
nnoremap <silent> <SID>(git-log)      :<C-u>Unite giti/log<CR>

nnoremap <silent><expr> <SID>(git-log-this-file) ':<C-u>Unite giti/log:' . expand('%:p') . '<CR>'
" }}}

nnoremap <silent> <SID>(source) :<C-u>Unite source<CR>

" neobundle {{{
nnoremap <silent> <SID>(neobundle)        :<C-u>Unite neobundle<CR>
nnoremap <silent> <SID>(neobundle-update) :<C-u>Unite neobundle/install:!<CR>
" }}}

" sonictemplate {{{
nnoremap <silent> <SID>(sonictemplate) :<C-u>Unite sonictemplate<CR>
" }}}

nnoremap <silent> <SID>(color) :<C-u>Unite -auto-preview colorscheme<CR>

" immediately actions {{{
nnoremap <silent> <expr> <SID>(immediately-rename) ':<C-u>Unite file -input=' . expand('%:p') . ' -default-action=rename -immediately<CR>'
"}}}
"}}}

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
