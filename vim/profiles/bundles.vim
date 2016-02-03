" neobundle
filetype off

if has('vim_starting')
  if isdirectory(expand('~/.bundle/neobundle.vim'))
    set runtimepath+=~/.bundle/neobundle.vim/
  else
    finish
  endif
endif

call neobundle#begin(expand('~/.bundle'))

" Shougo's plugins (https://github.com/Shougo) {{{
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/echodoc'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/vimproc', {
\ 'build' : {
\   'mac'  : 'make -f make_mac.mak',
\   'unix' : 'make -f make_unix.mak',
\ }
\}
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-outline'
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
NeoBundleLazy 'mattn/emmet-vim'
" }}}

" tyru's plugins (https://github.com/tyru) {{{
NeoBundle 'tyru/vim-altercmd'
NeoBundle 'tyru/open-browser.vim'
" }}}

" h1mesuke's plugins (https://github.com/h1mesuke) {{{
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'h1mesuke/textobj-wiw', {
\   'depends' : [
\       'kana/vim-textobj-user',
\   ]
\}
NeoBundleLazy 'h1mesuke/vim-unittest'
" }}}

" haya14busa's plugins (https://github.com/haya14busa) {{{
NeoBundleLazy 'haya14busa/vital-power-assert', {
\ 'depends' : [
\   'haya14busa/vital-vimlcompiler',
\   'vim-jp/vital.vim'
\ ]
\}
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
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'lambdalisue/vital-VCS-Git'
NeoBundle 'tpope/vim-abolish'
NeoBundle 'tacroe/unite-mark'
NeoBundle 'haruyama/vim-matchopen'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundleLazy 'chrisbra/csv.vim'
NeoBundleLazy 'kchmck/vim-coffee-script'
NeoBundleLazy 'basyura/TweetVim', {
\   'depends' : [
\       'tyru/open-browser.vim',
\       'basyura/twibill.vim',
\       'mattn/webapi-vim',
\       'Shougo/unite-outline',
\       'basyura/bitly.vim',
\       'basyura/bitly.vim',
\       'Shougo/unite.vim',
\       'mattn/favstar-vim',
\   ]
\}
NeoBundle 'OmniSharp/omnisharp-vim', {
\ 'build' : {
\   'mac'  : 'git submodule update --init --recursive && cd server && xbuild',
\   'unix' : 'git submodule update --init --recursive && cd server && xbuild',
\ }
\}
NeoBundleLazy 'OrangeT/vim-csharp', {
\   'autoload': {'filetypes': ['cs']}
\ }
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'easymotion/vim-easymotion'
" }}}

" my plugins {{{
NeoBundle 'kmnk/vim-unite-giti', {
\ 'depends' : [
\   'thinca/vim-themis'
\ ]
\}
" }}}

" my forked plugins {{{
NeoBundle 'kmnk/sonictemplate-vim' " TODO not fork should extends http://mattn.kaoriya.net/software/vim/20110728094347.htm
" }}}

call neobundle#end()

filetype plugin on
filetype indent on
