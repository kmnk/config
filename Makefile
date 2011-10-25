# Makefile
.PHONY: all linux windows update clean

all: linux

linux:
	echo 'source '`pwd`'/dotfiles/dot.vimrc' > ~/.vimrc
	git clone git://github.com/Shougo/neobundle.vim.git neobundle.vim
	vim -u ./vim/local/bundles.vim +NeoBundleInstall +q
	rm -rf neobundle.vim
	mkdir ~/.vim
	ln -s ./vim/autoload ~/.vim/autoload
	ln -s ./vim/colors ~/.vim/colors
	ln -s ./vim/ftdetect ~/.vim/ftdetect
	ln -s ./vim/ftplugin ~/.vim/ftplugin
	ln -s ./vim/templates ~/.vim/templates
	ln -s ./dotfiles/dot.zshrc ~/.zshrc
	ln -s ./dotfiles/dot.screenrc ~/.screenrc

windows:

update:
	git pull
	vim -u ./vim/local/bundles.vim +NeoBundleInstall! +q

clean:
	vim -u ./vim/local/bundles.vim +NeoBundleClean +q
