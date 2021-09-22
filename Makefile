none:
	@echo nothing to do

mac: vimrc tmux-conf zshrc .install-tmux .install-zsh; ## Initialize Mac config

vimrc: .install-dein
	echo 'source '`pwd`'/dotfiles/dot.vimrc' > ~/.vimrc

tmux-conf:
	echo 'source-file '`pwd`'/dotfiles/dot.tmux.conf' > ~/.tmux.conf

zshrc:
	echo 'source '`pwd`'/dotfiles/dot.zshrc' > ~/.zshrc
	touch ~/.zshrc_profile

clean: .clean-touched .clean-dein; ## Clean config

.install-tmux: .install-homebrew
	brew install tmux
	touch .install-tmux

.install-zsh: .install-homebrew
	brew install zsh
	touch .install-zsh

.install-homebrew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	touch .install-homebrew

.install-dein: .install-deno
	curl -fLsS https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > dein-installer.sh
	sh ./dein-installer.sh ./.cache/dein
	rm ./dein-installer.sh
	touch .install-dein

.clean-dein:
	rm -rf ./.cache/dein

.install-deno:
	curl -fLsS https://deno.land/x/install/install.sh | sh
	touch .install-deno

# cannot maintenance :(
.clean-touched:
	rm -f .install-*

help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

