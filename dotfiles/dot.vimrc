" kmnk's vim settings

" load plugins by pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" reset my auto command group
augroup KmnkAutoCmd
  autocmd!
augroup END

" is windows ?
let s:is_windows  = (has('win32') || has('win64'))

" my mapleader
let mapleader = ','

" status line settings
set laststatus=2
let &statusline = '%<%f %m%r%h%w[%{(&fenc!=""?&fenc:&enc)}][%{&ff}]%=%{cfi#format("[%s()]", "no function")} %l,%c%V%8P'

" default tab settings
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" 
set showcmd
set showmatch
set hlsearch

" disp always number of lines
set nocompatible
set number
nnoremap <Leader>1 :<C-u>set number!<CR>

" accent current line
set cursorline

" no error alarm
set vb t_vb=

" backspace
set backspace=indent,eol,start

"
set virtualedit&
set virtualedit+=block

" break undo sequence on <C-w>
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

" operator replace
nnoremap R <Plug>(operator-replace)

" indent
set autoindent
set nocindent
set smartindent

" useful key maps {{{
" redo command by two type
nnoremap c. @:

" * on visualmode 
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>

" substitute current word
nnoremap <expr> s* ':%substitute/\<' . expand('<cword>') . '\>/'

" in pattern escape
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

" Yank like C and D
nnoremap Y y$

" select latest changes
nnoremap gc `[v`]

" tags-and-searches
nnoremap t  <Nop>
nnoremap tt  <C-]>
nnoremap tj  :<C-u>tag<CR>
nnoremap tk  :<C-u>pop<CR>
nnoremap tl  :<C-u>tags<CR>

" 
nnoremap ; :<C-u>w<CR>

" move tab
map <C-j> <SID>(to-next-tab)
map <C-k> <SID>(to-prev-tab)
nnoremap <SID>(to-next-tab)   gt
nnoremap <SID>(to-prev-tab)   gT

" split {{{
nmap <Space>sj <SID>(split-to-j)
nmap <Space>sk <SID>(split-to-k)
nmap <Space>sh <SID>(split-to-h)
nmap <Space>sl <SID>(split-to-l)

nnoremap <SID>(split-to-j) :<C-u>execute 'belowright' (v:count == 0 ? '' : v:count) 'split'<CR>
nnoremap <SID>(split-to-k) :<C-u>execute 'aboveleft'  (v:count == 0 ? '' : v:count) 'split'<CR>
nnoremap <SID>(split-to-h) :<C-u>execute 'topleft'    (v:count == 0 ? '' : v:count) 'vsplit'<CR>
nnoremap <SID>(split-to-l) :<C-u>execute 'botright'   (v:count == 0 ? '' : v:count) 'vsplit'<CR>
"}}}
"}}}

" no guioptions
if has('gui_running')
  set go=
endif

" TOhtml options {{{
let g:use_xhtml     = 1
let g:html_use_css  = 1
let g:html_no_pre   = 1

" help key map
nnoremap <C-h> :<C-u>h<Space>
nnoremap <BS>  :<C-u>h<Space>

" edit vimrc right now
nnoremap <silent> <Space>ev  :<C-u>tabedit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>tabedit $MYGVIMRC<CR>

" Load .gvimrc after .vimrc edited at GVim.
nnoremap <silent> <Space>lv :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif <CR>
nnoremap <silent> <Space>lg :<C-u>source $MYGVIMRC<CR>
"}}}

" create swp data to only tmp directory
set directory-=.

" useful commands {{{
" rename by one command
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))
"}}}

" ignore and smartcase
set ignorecase
set smartcase

" <Leader>ao move current buffer into a new tab.
nnoremap <silent> <Leader>ao :<C-u>call <SID>move_window_into_tab_page(0)<Cr>
" kana's useful tab function {{{
function! s:move_window_into_tab_page(target_tabpagenr)
  " Move the current window into a:target_tabpagenr.
  " If a:target_tabpagenr is 0, move into new tab page.
  if a:target_tabpagenr < 0  " ignore invalid number.
    return
  endif
  let original_tabnr = tabpagenr()
  let target_bufnr = bufnr('')
  let window_view = winsaveview()

  if a:target_tabpagenr == 0
    tabnew
    tabmove  " Move new tabpage at the last.
    execute target_bufnr 'buffer'
    let target_tabpagenr = tabpagenr()
  else
    execute a:target_tabpagenr 'tabnext'
    let target_tabpagenr = a:target_tabpagenr
    topleft new  " FIXME: be customizable?
    execute target_bufnr 'buffer'
  endif
  call winrestview(window_view)

  execute original_tabnr 'tabnext'
  if 1 < winnr('$')
    close
  else
    enew
  endif

  execute target_tabpagenr 'tabnext'
endfunction " }}}

" Load settings for each location. {{{
augroup vimrc-local "{{{
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END "}}}

function! s:vimrc_local(loc)  "{{{
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction "}}}
"}}}

" Command-line window {{{
nnoremap <sid>(command-line-enter) q:
xnoremap <sid>(command-line-enter) q:
nnoremap <sid>(command-line-norange) q:<C-u>

nmap : <sid>(command-line-enter)
xmap : <sid>(command-line-enter)

autocmd KmnkAutoCmd CmdwinEnter * call s:init_cmdwin()  "{{{
function! s:init_cmdwin()
  nnoremap <buffer> q :<C-u>quit<CR>
  nnoremap <buffer> <TAB> :<C-u>quit<CR>
  inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
  inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
  inoremap <buffer> qq <Esc>:<C-u>quit<CR>
  inoremap <buffer> kk <Esc>k

  " Completion.
  inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  call altercmd#define('b', 'gr[ep]', 'Grep', 'i')

  startinsert!
endfunction "}}}
"}}}

augroup vimrc-auto-mkdir  "{{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)  "{{{
    if !isdirectory(a:dir) && (a:force ||
    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  "}}}
augroup END  "}}}

" svn move current file to : SvnMove {{{
command! -nargs=1 -complete=file -bang SvnMove call s:MoveCurrentFileTo('<args>', '<bang>')
function! s:MoveCurrentFileTo(file, bang)   "{{{
  let l:res   = system('svn move ' . expand('%') . ' ' . a:file)
  if a:bang == ''
    echo l:res
  endif
endfunction "}}}
"}}}

" cd current directory command : CD {{{
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>') 
function! s:ChangeCurrentDir(directory, bang) "{{{
  if a:directory == ''
    lcd %:p:h
  else
    execute 'lcd' . a:directory
  endif

  if a:bang == ''
    pwd
  endif
endfunction "}}}

" Change current directory.
nnoremap <silent> <C-,>cd :<C-u>CD<CR>
"}}}

" syntax completion settings {{{
filetype on

" syntax completetion on any language {{{
autocmd KmnkAutoCmd FileType *
\   if &l:omnifunc == ''
\ |   setlocal omnifunc=syntaxcomplete#Complete
\ | endif
"}}}

" open popup in always
set completeopt=menuone,preview

" completion targets
set complete=.,w,b,u,t,i

set pumheight=20
set completefunc=
set omnifunc&
set omnifunc+=
"}}}

" color settings {{{
set t_Co=256
colorscheme lucius
"}}}

" CSV high light
command! -nargs=1 Csvhl :call s:CSVH(<args>)
function! s:CSVH(x)   "{{{
  execute 'match Keyword /^\([^,]*,\)\{'.a:x.'}\zs[^,]*/'
  execute 'normal ^'.a:x.'f,'
endfunction "}}}

" highlights {{{
highlight MultiByteSpace ctermbg=LightGray guibg=LightGray
match MultiByteSpace /　/
autocmd KmnkAutoCmd WinEnter * match MultiByteSpace /　/
highlight TooLongLine ctermbg=yellow guibg=yellow
match TooLongLine /.\%>77v/
autocmd KmnkAutoCmd WinEnter * match TooLongLine /.\%>77v/
highlight EOLWhiteSpace ctermbg=red guibg=red
match EOLWhiteSpace /\s\+$/
autocmd KmnkAutoCmd WinEnter * match EOLWhiteSpace /\s\+$/
"}}}

" {{{
command! -complete=file -nargs=+ Grep  call s:grep([<f-args>])
function! s:grep(args)
  execute 'vimgrep' '/'.a:args[-1].'/' join(a:args[:-2])
endfunction
"}}}

" set file type (setf) {{{
augroup FileTypeCmd
  autocmd!
augroup END
autocmd FileTypeCmd FileType js setlocal ft=javascript
autocmd FileTypeCmd FileType pl setlocal ft=perl
"}}}

" align setting
let g:Align_xstrlen=3

" AllMaps
command!
\   -nargs=* -complete=mapping
\   AllMaps
\   map <args> | map! <args> | lmap <args>

" textobjs {{{
" match like hoge::fuga::piyo
if exists('g:loaded_textobj_dc')
  finish
endif

let g:loaded_textobj_dc = 1

call textobj#user#plugin('dc', {
\   'double_colon': {
\     '*pattern*': '\w\+\(::\w\+\)\+',
\     'select': ['a:', 'i:'],
\   }})

" match like $hoge or @fuga or %piyo
if exists('g:loaded_textobj_sigil')
  finish
endif

let g:loaded_textobj_sigil = 1

call textobj#user#plugin('sigil', {
\   'sigil': {
\     '*pattern*': '[$@%]\+[_A-Za-z]\+\w*',
\     'select': ['aw'],
\   }})
"}}}

" unite settings {{{
let g:unite_split_rule  = 'botright'

" The prefix key.
nnoremap [unite] <Nop>
nmap <Leader>. [unite]

" maps
nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=files bookmark file_rec buffer<CR>

nnoremap <silent> [unite]c :<C-u>UniteWithBufferDir -buffer-name=files -prompt=buffer_dir> bookmark file buffer <CR>

nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=files -prompt=buffer> buffer<CR>

"nnoremap <silent> [unite]r :<C-u>UniteResume files<CR>

" unite-grep
let g:unite_source_grep_default_opts = '-iRHn'
nnoremap <expr> g*    ':Unite grep:' . expand('%:h')     . "<CR>" . expand('<cword>') . "<CR>"
nnoremap <expr> g.*   ':Unite grep:' . expand('%:h')     . "<CR>" . expand('<cword>') . "<CR>"
nnoremap <expr> g..*  ':Unite grep:' . expand('%:h:h')   . "<CR>" . expand('<cword>') . "<CR>"
nnoremap <expr> g...* ':Unite grep:' . expand('%:h:h:h') . "<CR>" . expand('<cword>') . "<CR>"

nnoremap <silent> [unite]o :<C-u>Unite -vertical -direction=topleft -auto-preview outline<CR>
nnoremap <silent> [unite]m :<C-u>Unite mark<CR>
nnoremap <silent> [unite]r :<C-u>Unite register<CR>
nnoremap <silent> [unite]hc :<C-u>Unite history/command<CR>
nnoremap <silent> [unite]hs :<C-u>Unite history/search<CR>
nnoremap <silent> [unite]<C-h> :<C-u>Unite help<CR>

nnoremap <silent> [unite]vst :<C-u>Unite svn/status<CR>
nnoremap <silent> [unite]vdi :<C-u>Unite -vertical -direction=topleft -auto-preview svn/diff<CR>
nnoremap <silent> [unite]vbl :<C-u>Unite -vertical -direction=topleft svn/blame:<C-r>%<CR>

nnoremap  [unite]f  :<C-u>Unite source<CR>

" unite colorscheme font
if globpath(&rtp, 'plugin/unite.vim') != ''
  nnoremap sc :<C-u>Unite -auto-preview colorscheme<Cr>
endif

autocmd KmnkAutoCmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  nmap <buffer> <ESC>   <Plug>(unite_exit)
  imap <buffer> jj      <Plug>(unite_insert_leave)
  imap <buffer> <C-w>   <Plug>(unite_delete_backward_path)
  nmap <buffer> l       <Plug>(unite_toggle_mark_current_candidate)
  nmap <buffer> h       <Plug>(unite_toggle_mark_current_candidate)
  imap <buffer> qq      <Plug>(unite_exit)

  " Start insert.
  let g:unite_enable_start_insert = 1
endfunction"}}}
"}}}

" alignta settings {{{
vmap <Leader>al <SID>(setup-alignta)
vnoremap <SID>(setup-alignta) :Align
"}}}

" vimfiler settings {{{
call vimfiler#set_execute_file('vim', 'vim')
call vimfiler#set_execute_file('txt', 'notepad')
"let g:vimfiler_split_command = ''

" Edit file by tabedit.
let g:vimfiler_edit_command = 'tabedit'

"let g:vimfiler_pedit_command = 'vnew'
let g:vimfiler_external_copy_directory_command = 'cp -r $src $dest'
let g:vimfiler_external_copy_file_command = 'cp $src $dest'
let g:vimfiler_external_delete_command = 'rm -r $srcs'
let g:vimfiler_external_move_command = 'mv $srcs $dest'
let g:vimfiler_as_default_explorer = 1

" Enable file operation commands.
"let g:vimfiler_safe_mode_by_default = 0
"}}}

" vimshell settings {{{
nmap <Space>; <SID>(launch-vimshell)
nnoremap <SID>(launch-vimshell) :<C-u>VimShellPop<CR>
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_right_prompt = 'vimshell#vcs#info("(%s)-[%b]", "(%s)-[%b|%a]")'
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

autocmd KmnkAutoCmd FileType vimshell
\ call vimshell#altercmd#define('g', 'git')
\| call vimshell#altercmd#define('i', 'iexe')
\| call vimshell#altercmd#define('l', 'll')
\| call vimshell#altercmd#define('ll', 'ls -l')
\| call vimshell#hook#set('chpwd', ['g:my_chpwd'])
\| call vimshell#hook#set('emptycmd', ['g:my_emptycmd'])
\| call vimshell#hook#set('preprompt', ['g:my_preprompt'])
\| call vimshell#hook#set('preexec', ['g:my_preexec'])

function! g:my_chpwd(args, context)
  call vimshell#execute('echo "chpwd"')
endfunction
function! g:my_emptycmd(cmdline, context)
  call vimshell#execute('echo "emptycmd"')
  return a:cmdline
endfunction
function! g:my_preprompt(args, context)
  call vimshell#execute('echo "preprompt"')
endfunction
function! g:my_preexec(cmdline, context)
  call vimshell#execute('echo "preexec"')

  let l:args = vimproc#parser#split_args(a:cmdline)
  if len(l:args) > 0 && l:args[0] ==# 'diff'
    call vimshell#set_syntax('diff')
  endif

  return a:cmdline
endfunction
"}}}

" git-vim settings {{{
let g:git_no_map_default = 1
let g:git_command_edit = 'rightbelow vnew'
nnoremap <C-,>gd :<C-u>GitDiff --cached<Enter>
nnoremap <C-,>gD :<C-u>GitDiff<Enter>
nnoremap <C-,>gs :<C-u>GitStatus<Enter>
nnoremap <C-,>gl :<C-u>GitLog<Enter>
nnoremap <C-,>gL :<C-u>GitLog -u \| head -10000<Enter>
nnoremap <C-,>ga :<C-u>GitAdd<Enter>
nnoremap <C-,>gA :<C-u>GitAdd <cfile><Enter>
nnoremap <C-,>gc :<C-u>GitCommit<Enter>
nnoremap <C-,>gC :<C-u>GitCommit --amend<Enter>
nnoremap <C-,>gp :<C-u>Git push
"}}}

" neocomplcache settings {{{
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd KmnkAutoCmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd KmnkAutoCmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd KmnkAutoCmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd KmnkAutoCmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd KmnkAutoCmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"}}}

" quickrun settings {{{
for [key, com] in items({
\   '<Leader>x' : '>:',
\   '<Leader>p' : '>!',
\   '<Leader>w' : '>',
\   '<Leader>q' : '>>',
\ })
  execute 'nnoremap <silent>' key ':QuickRun' com '-mode n -split vertical<CR>'
  execute 'vnoremap <silent>' key ':QuickRun' com '-mode v -split vertical<CR>'
endfor
"}}}

" auto updater of dotfiles {{{
autocmd KmnkAutoCmd BufWritePost */config/dotfiles/dot.vimrc nested
\ write! $MYVIMRC
autocmd KmnkAutoCmd BufWritePost */config/dotfiles/dot.gvimrc nested
\ write! $MYGVIMRC
if !s:is_windows "{{{
  autocmd KmnkAutoCmd BufWritePost */config/dotfiles/dot.screenrc
\   write! $HOME/.screenrc
  autocmd KmnkAutoCmd BufWritePost */config/dotfiles/dot.zshrc
\   write! $HOME/.zshrc
endif "}}}
"}}}

" autoloader of .vimrc {{{
if !has('gui_running') && !s:is_windows
  autocmd KmnkAutoCmd BufWritePost $MYVIMRC nested source $MYVIMRC
else
  autocmd KmnkAutoCmd BufWritePost $MYVIMRC source $MYVIMRC | 
\   if has('gui_running') | source $MYGVIMRC  
  autocmd KmnkAutoCmd BufWritePost $MYGVIMRC
\   if has('gui_running') | source $MYGVIMRC
endif
"}}}

" Open junk file. {{{
nmap <Space>\ <SID>(open-junk-file)
nnoremap <SID>(open-junk-file) :<C-u>JunkFile<CR>
command! -nargs=0 JunkFile call s:open_junk_file()
function! s:open_junk_file() "{{{
  let l:junk_dir = $HOME . '/.vim_junk'. strftime('/%Y/%m')
  if !isdirectory(l:junk_dir)
    call mkdir(l:junk_dir, 'p')
  endif

  let l:filename = input('Junk Code: ', l:junk_dir.strftime('/%Y-%m-%d-%H%M%S.'))
  if l:filename != ''
    execute 'edit ' . l:filename
  endif
endfunction "}}}
"}}}

" encoding settings {{{
" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd KmnkAutoCmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

"改行コード指定
set fileformat=unix
"ファイルエンコード(japan = euc-jp)
set fileencoding=utf-8
"ファイルエンコーディングス(set fileencode=xxxで、文字コード変更用･･･？)
set fileencodings=utf-8,japan,sjis,iso-2022-jp

command! -bang -nargs=? Utf8  edit<bang> ++enc=utf-8  <args>
command! -bang -nargs=? EucJp edit<bang> ++enc=euc-jp <args>
"}}}

" perl settings {{{
set iskeyword+=:
" Dump
"   use Data::Dumper;
"   print {*STDERR} Dumper();
nmap <Leader>dump ouse Data::Dumper;<CR>print {*STDERR} Dumper();<ESC>h
nmap <Leader>Dump ouse Data::Dumper;<CR>print {*STDERR} Dumper(<C-R>");<ESC>h

" open perldoc
nmap <Leader>pod :! perldoc %<CR>
nmap <Leader>setp :set filetype=perl<CR>
"}}}

" new scouter
function! Scouter(file, ...) "{{{
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)
"}}}

" unnamed clipboard
set clipboard+=unnamed

" vim: expandtab softtabstop=2 shiftwidth=2
" vim: foldmethod=marker
