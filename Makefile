all:
	echo 'nothing to do'

.vimrc: dein-installer.sh .cache
	echo 'source '`pwd`'/dotfiles/dot.vimrc' > ~/.vimrc

dein-installer.sh:
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein-installer.sh
	sh ./dein-installer.sh ./.cache/dein

.cache:
	mkdir ./.cache
