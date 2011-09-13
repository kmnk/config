# Makefile
.PHONY: all submodule update-submodules update

all: submodule

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
