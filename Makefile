# Makefile
.PHONY: all update

all: linux

linux:
	echo 'source '`pwd`'/dotfiles/dot.vimrc' > ~/.vimrc
	git clone git://github.com/Shougo/neobundle.vim.git neobundle.vim
	vim -u ./vim/local/bundles.vim +NeoBundleInstall +q
	rm -rf neobundle.vim
	mkdir ~/.vim
	ln -s `pwd`/vim/autoload ~/.vim/autoload
	ln -s `pwd`/vim/colors ~/.vim/colors
	ln -s `pwd`/vim/ftdetect ~/.vim/ftdetect
	ln -s `pwd`/vim/ftplugin ~/.vim/ftplugin
	ln -s `pwd`/vim/templates ~/.vim/templates
	ln -s ./dotfiles/dot.zshrc ~/.zshrc
	ln -s ./dotfiles/dot.screenrc ~/.screenrc
	cd ~/.bundle/vimproc/ && make -f make_gcc.mak

windows:

vim-install:
	vim -u ./vim/local/bundles.vim +NeoBundleInstall +q

update: vim-update git-update

vim-update:
	vim -u ./vim/local/bundles.vim +NeoBundleInstall! +q

git-update:
	git pull

vim-clean:
	vim -u ./vim/local/bundles.vim +NeoBundleClean +q
