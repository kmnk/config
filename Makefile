# Makefile
.PHONY: linux mac windows vim-setup install update clean

linux: setup vim-setup vim-make-vimproc-linux

mac: setup vim-setup vim-make-vimproc-mac

windows: vim-setup

setup:
	echo 'source '`pwd`'/dotfiles/dot.zshrc' >> ~/.zshrc
	echo 'source '`pwd`'/dotfiles/dot.screenrc' >> ~/.screenrc

vim-setup: vim-setup-vimrc vim-install-bundle vim-install-plugins

vim-setup-vimrc:
	echo 'source '`pwd`'/dotfiles/dot.vimrc' >> ~/.vimrc
	echo '"root:     '`pwd` >> ~/.vimrc
	echo '"profiles: '`pwd`'/config/vim/profiles' >> ~/.vimrc
	echo '".vim:     '`pwd`'/config/vim/dot.vim' >> ~/.vimrc

vim-install-bundle:
	mkdir -p ~/.bundle
	git clone git://github.com/Shougo/neobundle.vim.git ~/.bundle/neobundle.vim

vim-make-vimproc-linux:
	cd ~/.bundle/vimproc/ && make -f make_gcc.mak

vim-make-vimproc-mac:
	cd ~/.bundle/vimproc/ && make -f make_mac.mak


install: vim-install-plugins

vim-install-plugins:
	vim -u ./vim/profiles/bundles.vim +NeoBundleInstall +q


update: vim-update-plugins git-update

vim-update-plugins:
	vim -u ./vim/profiles/bundles.vim +NeoBundleInstall! +q

git-update:
	git pull


clean: vim-clean-plugins

vim-clean-plugins:
	vim -u ./vim/profiles/bundles.vim +NeoBundleClean +q
