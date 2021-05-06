#!/bin/bash

# Exit when any command fails
set -e

source logger.sh

function install_brew_bundles {
    info "Installing Homebrew"
    
    OUTPUT=$(brew --version)
    
    if [ $? -ne 0 ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        warn "Brew exists"
    fi
    
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
    PLIST_PATH=~/Library/Preferences/com.googlecode.iterm2.plist
    
    plutil -replace "New Bookmarks".0."Normal Font" -string "ConsolasForPowerline 15" $PLIST_PATH
    plutil -replace "New Bookmarks".0."Non Ascii Font" -string "RobotoMonoNerdFontCompleteM-Regular 15" $PLIST_PATH
    plutil -replace "New Bookmarks".0."Status Bar Layout".components -xml "$(cat $PWD/iterm2/config.plist)" $PLIST_PATH
    plutil -replace "New Bookmarks".0."Show Status Bar" -bool TRUE $PLIST_PATH
}

function generate_ssh_key {
    sh ./ssh-key-generator.sh
}

function setup_fish_shell {
    sh ./setup-fish.sh
}

function set_power_management {
    sudo pmset -c sleep 0
}

install_brew_bundles
set_fish_as_default_shell
set_iterm2_profile
setup_fish_shell
generate_ssh_key
set_power_management

info "Mac is setup. Please check for any [WARN] and do the needful and do not forget to check the todo list which need to be setup manually for now. Happy Coding!!!"