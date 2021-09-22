none:
	@echo nothing to do

mac: vimrc ## Initialize mac config

vimrc: .install-dein ## Generate first vimrc
	echo 'source '`pwd`'/dotfiles/dot.vimrc' > ~/.vimrc

clean: .clean-dein; ## Clean config

.install-dein: .install-deno
	curl -fLsS https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein-installer.sh
	sh ./dein-installer.sh ./.cache/dein
	rm ./dein-installer.sh
	touch .install-dein

.clean-dein:
	rm -rf ./.cache/dein
	rm -f .install-dein
	rm -f .install-deno

.install-deno:
	curl -fLsS https://deno.land/x/install/install.sh | sh
	touch .install-deno

help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

