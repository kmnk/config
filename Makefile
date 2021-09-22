all: .vimrc; ## Initialize config

.vimrc: install-dein ## Generate first vimrc
	echo 'source '`pwd`'/dotfiles/dot.vimrc' > ~/.vimrc

install-dein: dein-installer.sh; ## Install dein

clean-dein-cache: ## Clean dein cache
	rm -rf ./.cache/dein
	rm ./dein-installer.sh

dein-installer.sh: install-deno
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein-installer.sh
	sh ./dein-installer.sh ./.cache/dein

install-deno:
	curl -fsSL https://deno.land/x/install/install.sh | sh

help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

