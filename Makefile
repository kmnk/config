# Makefile
.PHONY: all linux windows submodule update-submodules update

all: linux submodule

linux:
	cp dotfiles/dot.vimrc ~/.vimrc
	cp dotfiles/dot.zshrc ~/.zshrc
	cp dotfiles/dot.screenrc ~/.screenrc

windows:

submodule:
	git submodule init
	git submodule update
	cd vim/bundle/ && \
	for dir in `ls` ; do \
		cd $$dir ; \
		git checkout master ; \
		cd .. ; \
	done

update-submodules:
	cd vim/bundle/ && \
	for dir in `ls` ; do \
		cd $$dir ; \
		git pull ; \
		cd .. ; \
	done
