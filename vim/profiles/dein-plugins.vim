" Shougo's plugins {{{
call dein#add('Shougo/ddu.vim')

call dein#add('Shougo/ddc.vim')
call dein#add('Shougo/ddc-around', {'on_source': 'ddc.vim'})
call dein#add('Shougo/ddc-matcher_head', {'on_source': 'ddc.vim'})
call dein#add('Shougo/ddc-sorter_rank', {'on_source': 'ddc.vim'})
call dein#add('Shougo/ddc-nvim-lsp', {'on_source': 'ddc.vim'})

call dein#add('Shougo/defx.nvim')

call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/neomru.vim')

" Shougo's plugins }}}

call dein#add('vim-denops/denops.vim')

call dein#add('tpope/vim-fugitive')

call dein#add('altercation/vim-colors-solarized')

call dein#add('thinca/vim-visualstar')

call dein#add('mattn/vim-sonictemplate')

call dein#add('kana/vim-submode')

call dein#add('phpactor/phpactor', {
\ 'on_ft': ['php'],
\ 'build': 'composer install',
\})

"call dein#add('neoclide/coc.nvim', {
"\ 'build': 'sh -c "'
"\   . 'brew install nodenv '
"\   . '& nodenv install 15.8.0 '
"\   . '& nodenv local 15.8.0 '
"\   . '& yarn install --frozen-lockfile'
"\   . '"'
"\})

" my plugins {{{
call dein#add('kmnk/denite-dirmark')
call dein#add('kmnk/gitn')
call dein#add('kmnk/sonictemplate-vim-denite-extension')
" my plugins }}}
