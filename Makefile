all:
	echo 'nothing to do'

.vimrc: install-dein
	echo 'source '`pwd`'/dotfiles/dot.vimrc' > ~/.vimrc

install-dein: dein-installer.sh .cache;

clean-dein-cache:
	rm -rf ./.cache/dein
	rm ./dein-installer.sh

dein-installer.sh: install-deno
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein-installer.sh
	sh ./dein-installer.sh ./.cache/dein

.cache/dein:
	mkdir -p ./.cache/dein

install-deno:
	curl -fsSL https://deno.land/x/install/install.sh | sh

