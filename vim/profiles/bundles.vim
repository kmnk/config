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

NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/echodoc.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vim-vcs.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/Shougo/vinarise.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'

NeoBundle 'git://github.com/kana/vim-operator-replace.git'
NeoBundle 'git://github.com/kana/vim-operator-user.git'
NeoBundle 'git://github.com/kana/vim-surround.git'
NeoBundle 'git://github.com/kana/vim-grex.git'
NeoBundle 'git://github.com/kana/vim-smartchr.git'
NeoBundle 'git://github.com/kana/vim-textobj-indent.git'
NeoBundle 'git://github.com/kana/vim-textobj-user.git'
NeoBundle 'git://github.com/kana/vim-submode.git'

NeoBundle 'git://github.com/thinca/vim-unite-history.git'
NeoBundle 'git://github.com/thinca/vim-openbuf.git'
NeoBundle 'git://github.com/thinca/vim-localrc.git'
NeoBundle 'git://github.com/thinca/vim-visualstar.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'git://github.com/thinca/vim-prettyprint.git'

NeoBundle 'git://github.com/ujihisa/quickrun.git'
NeoBundle 'git://github.com/ujihisa/unite-colorscheme.git'
NeoBundle 'git://github.com/ujihisa/neco-look.git'

NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/mattn/webapi-vim.git'
NeoBundle 'git://github.com/mattn/learn-vimscript.git'
NeoBundle 'git://github.com/mattn/wwwrenderer-vim.git'


NeoBundle 'git://github.com/Sixeight/unite-grep.git'

NeoBundle 'git://github.com/vim-scripts/Align.git'
NeoBundle 'git://github.com/vim-scripts/IndentAnything.git'
NeoBundle 'git://github.com/vim-scripts/Javascript-Indentation.git'
NeoBundle 'git://github.com/vim-scripts/QuickBuf.git'

NeoBundle 'git://github.com/tyru/simpletap.vim.git'
NeoBundle 'git://github.com/tyru/vim-altercmd.git'
NeoBundle 'git://github.com/tyru/visualctrlg.vim.git'

NeoBundle 'git://github.com/tsukkee/unite-help.git'

NeoBundle 'git://github.com/tacroe/unite-mark.git'

NeoBundle 'git://github.com/h1mesuke/vim-unittest.git'
NeoBundle 'git://github.com/h1mesuke/vim-alignta.git'
NeoBundle 'git://github.com/h1mesuke/unite-outline.git'
NeoBundle 'git://github.com/h1mesuke/textobj-wiw.git'

NeoBundle 'git://github.com/choplin/unite-vim_hacks.git'

NeoBundle 'git://github.com/motemen/git-vim.git'

NeoBundle 'git://github.com/vim-scripts/VimClojure.git'
NeoBundle 'git://github.com/kchmck/vim-coffee-script.git'

NeoBundle 'git://github.com/kmnk/vim-unite-svn.git'
NeoBundle 'git://github.com/kmnk/vim-unite-giti.git'

" forked plugins {{{
NeoBundle 'git://github.com/kmnk/sonictemplate-vim.git'
NeoBundle 'git://github.com/kmnk/jslint.vim.git'
" }}}

filetype plugin on
filetype indent on
