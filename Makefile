# Makefile
.PHONY: all update

all: linux vim-install

linux:
	echo 'source '`pwd`'/dotfiles/dot.vimrc' > ~/.vimrc 
	mkdir -p ~/.bundle
	git clone git://github.com/Shougo/neobundle.vim.git ~/.bundle/neobundle.vim
	cd ~/.bundle/vimproc/ && make -f make_gcc.mak
	echo 'source '`pwd`'/dotfiles/dot.zshrc' > ~/.zshrc
	echo 'source '`pwd`'/dotfiles/dot.screenrc' > ~/.screenrc

windows:

vim-install:
	vim -u ./vim/local/bundles.vim +NeoBundleInstall +q

update: vim-update git-update

vim-update:
	vim -u ./vim/local/bundles.vim +NeoBundleInstall! +q

git-update:
	git pull

clean: vim-clean

vim-clean:
	vim -u ./vim/local/bundles.vim +NeoBundleClean +q
