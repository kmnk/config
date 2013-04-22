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

NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'Shougo/echodoc.git'
NeoBundle 'Shougo/unite.vim.git', {
\ 'rev ' : '86d752af096120e67c1996e5da8534333b2b486d'
\}
NeoBundle 'Shougo/vim-vcs.git'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vinarise.git'
NeoBundle 'Shougo/vimproc.git', {
\ 'build' : {
\   'mac'  : 'make -f make_mac.mak',
\   'unix' : 'make -f make_unix.mak',
\ }
\}

NeoBundle 'kana/vim-operator-replace.git'
NeoBundle 'kana/vim-operator-user.git'
NeoBundle 'kana/vim-surround.git'
NeoBundle 'kana/vim-grex.git'
NeoBundle 'kana/vim-smartchr.git'
NeoBundle 'kana/vim-textobj-indent.git'
NeoBundle 'kana/vim-textobj-user.git'
NeoBundle 'kana/vim-submode.git'

NeoBundle 'thinca/vim-unite-history.git'
NeoBundle 'thinca/vim-openbuf.git'
NeoBundle 'thinca/vim-localrc.git'
NeoBundle 'thinca/vim-visualstar.git'
NeoBundle 'thinca/vim-ref.git'
NeoBundle 'thinca/vim-prettyprint.git'

NeoBundle 'ujihisa/quickrun.git'
NeoBundleLazy 'ujihisa/unite-colorscheme.git'
NeoBundle 'ujihisa/neco-look.git'

NeoBundleLazy 'mattn/zencoding-vim.git'
NeoBundle 'mattn/webapi-vim.git'
NeoBundle 'mattn/learn-vimscript.git'
NeoBundle 'mattn/wwwrenderer-vim.git'


NeoBundle 'Sixeight/unite-grep.git'

NeoBundle 'vim-scripts/Align.git'
NeoBundle 'vim-scripts/IndentAnything.git'
NeoBundle 'vim-scripts/Javascript-Indentation.git'
NeoBundle 'vim-scripts/QuickBuf.git'

NeoBundle 'tyru/simpletap.vim.git'
NeoBundle 'tyru/vim-altercmd.git'
NeoBundle 'tyru/visualctrlg.vim.git'

NeoBundle 'tsukkee/unite-help.git'

NeoBundle 'tacroe/unite-mark.git'

NeoBundle 'h1mesuke/vim-unittest.git'
NeoBundle 'h1mesuke/vim-alignta.git'
NeoBundle 'h1mesuke/unite-outline.git'
NeoBundle 'h1mesuke/textobj-wiw.git'

NeoBundle 'choplin/unite-vim_hacks.git'

NeoBundle 'motemen/git-vim.git'

NeoBundle 'vim-scripts/VimClojure.git'
NeoBundle 'kchmck/vim-coffee-script.git'

NeoBundle 'kmnk/vim-unite-svn.git'
NeoBundle 'kmnk/vim-unite-giti.git'
NeoBundle 'kmnk/unite-pipe-command.git'

NeoBundle 'msanders/cocoa.vim.git'
NeoBundle 'garbas/vim-snipmate.git', {
\   'depends' : [
\       'MarcWeber/vim-addon-mw-utils',
\       'tomtom/tlib_vim',
\       'honza/vim-snippets',
\   ]
\}

" forked plugins {{{
NeoBundle 'kmnk/sonictemplate-vim.git'
NeoBundle 'kmnk/jslint.vim.git'
" }}}

filetype plugin on
filetype indent on
