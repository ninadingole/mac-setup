#!/bin/bash

# Exit when any command fails
set -e

source logger.sh

function install_brew_bundles {
	info "Installing Homebrew"
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	info "Installing brew bundles"
	brew bundle install -v --no-lock --file Brewfile
}

function set_fish_as_default_shell {
	info "Setting fish as default shell"
	BREW_PREFIX=$(brew --prefix)
	if ! fgrep -q "${BREW_PREFIX}/bin/fish" /etc/shells; then
		echo "${BREW_PREFIX}/bin/fish" | sudo tee -a /etc/shells
	fi
	chsh -s "${BREW_PREFIX}/bin/fish"
}

function set_iterm2_profile {
    info "Setting iterm2 profile"
    PROFILE_PATH=~/Library/Application\ Support/iTerm2/DynamicProfiles
    [ ! -d "$PROFILE_PATH" ] && echo "path not found"

    if [ -e "$PROFILE_PATH/profile.json" ]; then
		warn "Skipping symlink as profile already exist"
	else
		ln -s $PWD/iterm2/profile.json "$PROFILE_PATH/profile.json"
	fi
}

function generate_ssh_key {
	sh ./ssh-key-generator.sh
}

function setup_fish_shell {
    sh ./setup-fish.sh
}

install_brew_bundles
set_fish_as_default_shell
set_iterm2_profile
setup_fish_shell
generate_ssh_key

info "Mac is setup. Please check for any [WARN] and do the needful and do not forget to check the todo list which need to be setup manually for now. Happy Coding!!!"