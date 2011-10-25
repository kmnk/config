# Makefile
.PHONY: all linux windows update clean

all: linux

linux:
	echo 'source '`pwd`'/dotfiles/dot.vimrc' > ~/.vimrc
	git clone git://github.com/Shougo/neobundle.vim.git neobundle.vim
	vim -u ./vim/local/bundles.vim +NeoBundleInstall +q
	rm -rf neobundle.vim
	ln -s ./vim ~/.vim
	ln -s dotfiles/dot.zshrc ~/.zshrc
	ln -s dotfiles/dot.screenrc ~/.screenrc

windows:

update:
	git pull
	vim -u ./vim/local/bundles.vim +NeoBundleInstall! +q

clean:
	vim -u ./vim/local/bundles.vim +NeoBundleClean +q
