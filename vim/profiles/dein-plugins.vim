" dein-plugins

" Shougo's plugins {{{
"call dein#add('Shougo/ddu.vim')
call dein#add('Shougo/ddu.vim')
call dein#add('Shougo/ddu-commands.vim')

" ddu UIs {{{
call dein#add('Shougo/ddu-ui-ff')
call dein#add('Shougo/ddu-ui-filer')

call dein#add('Shougo/ddu-column-filename')
" }}}
" ddu sources {{{
call dein#add('Shougo/ddu-source-action')
call dein#add('Shougo/ddu-source-file')
call dein#add('Shougo/ddu-source-file_old')
call dein#add('Shougo/ddu-source-file_rec')
call dein#add('Shougo/ddu-source-line')
call dein#add('Shougo/ddu-source-register')
call dein#add('4513ECHO/ddu-source-colorscheme')
call dein#add('matsui54/ddu-source-help')
call dein#add('matsui54/ddu-source-man')
" }}}
" ddu kinds {{{
call dein#add('Shougo/ddu-kind-file')
call dein#add('Shougo/ddu-kind-word')
" }}}
" ddu filters {{{
call dein#add('Shougo/ddu-filter-matcher_substring')
call dein#add('Shougo/ddu-filter-matcher_relative')
call dein#add('Shougo/ddu-filter-matcher_hidden')
" }}}

call dein#add('Shougo/ddc.vim')
" ddc sources {{{
call dein#add('Shougo/ddc-around')
call dein#add('Shougo/ddc-matcher_head')
call dein#add('Shougo/ddc-sorter_rank')
call dein#add('Shougo/ddc-omni')
call dein#add('Shougo/ddc-source-nvim-lsp')
call dein#add('LumaKernel/ddc-file')
" ddc sources }}}
" ddc uis {{{
call dein#add('Shougo/ddc-ui-pum')
" ddc uis }}}

call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/pum.vim')
" Shougo's plugins }}}

" temorary specify fix commit
" TODO: resolve v4.0.0 retry loop error
"call dein#add('vim-denops/denops.vim', { 'rev': '4839ef4e283f8551286c826e44366ac6174cfc71' })
call dein#add('vim-denops/denops.vim')

call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-repeat')

call dein#add('altercation/vim-colors-solarized')

call dein#add('thinca/vim-visualstar')

call dein#add('mattn/vim-sonictemplate')

call dein#add('kana/vim-submode')
call dein#add('kana/vim-operator-replace')
call dein#add('kana/vim-operator-user')
call dein#add('kana/vim-textobj-user')

call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

call dein#add('ryanoasis/vim-devicons')

call dein#add('airblade/vim-gitgutter')

call dein#add('junegunn/vim-easy-align')

call dein#add('h1mesuke/textobj-wiw', {'depends': ['kana/vim-textobj-user']})

call dein#add('cespare/vim-toml')

call dein#add('rhysd/vim-healthcheck')

call dein#add('kuuote/ddu-source-mr')
call dein#add('lambdalisue/mr.vim')

" my plugins {{{
call dein#add('kmnk/study-denops')
call dein#add('kmnk/denite-dirmark')
call dein#add('kmnk/gitn', {
      \   'depends': ['Shougo/denite.nvim', 'tpope/vim-fugitive']
      \})
call dein#add('kmnk/sonictemplate-vim-denite-extension')
call dein#add('kmnk/denite-cmdl')
call dein#add('kmnk/ddu-source-git', {
      \   'rev': 'feature/make-core/devel'
      \})
call dein#add('kmnk/ddu-dirmark', {'rev': 'feature/read-and-write-dirmark-json/devel'})
" my plugins }}}

call dein#add('phpactor/phpactor', {
      \   'lazy': 1,
      \   'on_ft': ['php'],
      \   'build': 'composer install',
      \})

call dein#add('rust-lang/rust.vim', {
      \   'lazy': 1,
      \   'on_ft': ['rust'],
      \})

call dein#add('fatih/vim-go', {
      \   'lazy': 1,
      \   'on_ft': ['go'],
      \})

call dein#add('kchmck/vim-coffee-script', {
      \   'lazy': 1,
      \   'on_ft': ['coffee'],
      \})

call dein#add('leafgarland/typescript-vim', {
      \   'lazy': 1,
      \   'on_ft': ['typescript'],
      \})
