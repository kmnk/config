# Makefile
.PHONY: all submodule bundle update

all: submodule

submodule:
	git submodule init
	git submodule update
	cd vim/bundle/ && \
	for dir in `ls` ; do \
		cd $$dir ; \
		git checkout master \
		cd .. ; \
	done

bundle:
	cd vim/bundle/ && \
	for dir in `ls` ; do \
		cd $$dir ; \
		git pull ; \
		cd .. ; \
	done
