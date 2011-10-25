# Makefile
.PHONY: all linux windows update clean

all: linux

linux:
	echo 'source '`pwd`'/dotfiles/dot.vimrc' > ~/.vimrc
	git clone git://github.com/Shougo/neobundle.vim.git neobundle.vim
	vim -u ./vim/local/bundles.vim +NeoBundleInstall +q
	rm -rf neobundle.vim
	mkdir ~/.vim
	ln -s `pwd`/autoload ~/.vim/autoload
	ln -s `pwd`/colors ~/.vim/colors
	ln -s `pwd`/ftdetect ~/.vim/ftdetect
	ln -s `pwd`/ftplugin ~/.vim/ftplugin
	ln -s `pwd`/templates ~/.vim/templates
	ln -s `pwd`/dotfiles/dot.zshrc ~/.zshrc
	ln -s `pwd`/dotfiles/dot.screenrc ~/.screenrc

windows:

update:
	git pull
	vim -u ./vim/local/bundles.vim +NeoBundleInstall! +q

clean:
	vim -u ./vim/local/bundles.vim +NeoBundleClean +q
