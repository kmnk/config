none:
	@echo nothing to do

mac: vimrc tmux-conf zshrc .install-tmux .install-zsh .install-fonts; ## Initialize Mac config

vimrc: .install-dein .install-deno
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

.install-fonts: .install-homebrew
	brew tap homebrew/cask-fonts
	brew install --cask font-hack-nerd-font
	git clone git@github.com:powerline/fonts.git
	sh -c "cd fonts && ./install.sh && cd .. && rm -rf fonts"
	brew tap sanemat/font
	brew install ricty --with-powerline
	cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
	fc-cache -vf
	touch .install-fonts

.install-homebrew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	touch .install-homebrew

.install-dein:
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

