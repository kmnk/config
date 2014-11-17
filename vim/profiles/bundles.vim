" neobundle
filetype off

if has('vim_starting')
  if isdirectory(expand('~/.bundle/neobundle.vim'))
    set runtimepath+=~/.bundle/neobundle.vim/
  else
    finish
  endif
  call neobundle#rc(expand('~/.bundle'))
endif

" Shougo's plugins (https://github.com/Shougo) {{{
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/echodoc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\   'mac'  : 'make -f make_mac.mak',
\   'unix' : 'make -f make_unix.mak',
\ }
\}
" }}}

" kana's plugins (https://github.com/kana) {{{
NeoBundle 'kana/vim-operator-replace'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-surround'
NeoBundle 'kana/vim-grex'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'kana/vim-submode'
" }}}

" thinca's plugins (https://github.com/thinca) {{{
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'thinca/vim-quickrun'
NeoBundleLazy 'thinca/vim-prettyprint'
" }}}

" ujihisa's plugins (https://github.com/ujihisa) {{{
NeoBundleLazy 'ujihisa/unite-colorscheme'
" }}}

" mattn's plugins (https://github.com/mattn) {{{
NeoBundle 'mattn/learn-vimscript'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/wwwrenderer-vim'
NeoBundleLazy 'mattn/zencoding-vim'
" }}}

" tyru's plugins (https://github.com/tyru) {{{
NeoBundle 'tyru/vim-altercmd'
NeoBundle 'tyru/open-browser.vim'
" }}}

" h1mesuke's plugins (https://github.com/h1mesuke) {{{
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'h1mesuke/textobj-wiw', {
\   'depends' : [
\       'kana/vim-textobj-user',
\   ]
\}
NeoBundleLazy 'h1mesuke/vim-unittest'
" }}}

" tsukkee's plugins (https://github.com/tsukkee) {{{
NeoBundle 'tsukkee/unite-help'
" }}}

" vim-scripts repositories (https://github.com/vim-scripts) {{{
NeoBundle 'vim-scripts/Javascript-Indentation', {
\   'depends' : [
\       'vim-scripts/IndentAnything',
\   ]
\}
NeoBundleLazy 'vim-scripts/VimClojure'
NeoBundleLazy 'vim-scripts/confluencewiki.vim'
" }}}

" others {{{
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tacroe/unite-mark'
NeoBundle 'Sixeight/unite-grep'
NeoBundle 'haruyama/vim-matchopen'
NeoBundleLazy 'chrisbra/csv.vim'
NeoBundleLazy 'kchmck/vim-coffee-script'
NeoBundleLazy 'basyura/TweetVim', {
\   'depends' : [
\       'tyru/open-browser.vim',
\       'basyura/twibill.vim',
\       'mattn/webapi-vim',
\       'h1mesuke/unite-outline',
\       'basyura/bitly.vim',
\       'basyura/bitly.vim',
\       'Shougo/unite.vim',
\       'mattn/favstar-vim',
\   ]
\}

" }}}

" my plugins {{{
NeoBundle 'kmnk/vim-unite-svn'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'kmnk/unite-pipe-command'
" }}}

" my forked plugins {{{
NeoBundle 'kmnk/sonictemplate-vim' " TODO not fork should extends
" }}}

filetype plugin on
filetype indent on
