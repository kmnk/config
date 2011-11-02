# Makefile
.PHONY: all update

all: vim-install linux

linux:
	echo 'source '`pwd`'/dotfiles/dot.vimrc' >> ~/.vimrc 
	echo 'source '`pwd`'/dotfiles/dot.zshrc' >> ~/.zshrc
	echo 'source '`pwd`'/dotfiles/dot.screenrc' >> ~/.screenrc

windows:

vim-install:
	mkdir -p ~/.bundle
	git clone git://github.com/Shougo/neobundle.vim.git ~/.bundle/neobundle.vim
	vim -u ./vim/profiles/bundles.vim +NeoBundleInstall +q
	cd ~/.bundle/vimproc/ && make -f make_gcc.mak

vim-install-plugins:
	vim -u ./vim/profiles/bundles.vim +NeoBundleInstall +q

update: vim-update-plugins git-update

vim-update-plugins:
	vim -u ./vim/profiles/bundles.vim +NeoBundleInstall! +q

git-update:
	git pull

clean: vim-clean

vim-clean-plugins:
	vim -u ./vim/profiles/bundles.vim +NeoBundleClean +q
