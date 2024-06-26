#!/bin/bash

# Exit when any command fails
set -e

source logger.sh
source k9s/setup.sh

SHELL=$1

function install_brew_bundles {
    info "Installing Homebrew"
    
    if ! command -v brew &> /dev/null
    then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        warn "Brew exists"
    fi
    
    info "Installing brew bundles"
    brew bundle install -v --no-lock --file Brewfile
}

function accept_xcode_license {
    sudo xcodebuild -license accept
}

function set_iterm2_profile {
    info "Setting iterm2 profile"
    PLIST_PATH=~/Library/Preferences/com.googlecode.iterm2.plist
    
    plutil -replace "New Bookmarks".0."Normal Font" -string "ConsolasForPowerline 15" $PLIST_PATH
    plutil -replace "New Bookmarks".0."Non Ascii Font" -string "RobotoMonoNerdFontCompleteM-Regular 15" $PLIST_PATH
    plutil -replace "New Bookmarks".0."Use Non-ASCII Font" -bool TRUE $PLIST_PATH
    plutil -replace "New Bookmarks".0."Status Bar Layout".components -xml "$(cat $PWD/iterm2/config.plist)" $PLIST_PATH
    plutil -replace "New Bookmarks".0."Show Status Bar" -bool TRUE $PLIST_PATH
}

function generate_ssh_key {
    sh ./ssh-key-generator.sh
}

function setup_shell {
    if [ $SHELL == "fish" ]; then
        sh ./setup-fish.sh
        set_fish_as_default_shell
    fi
    
    if [ $SHELL == "zsh" ]; then
        sh ./setup-zsh.sh
    fi
}

function set_fish_as_default_shell {
    info "Setting fish as default shell"
    BREW_PREFIX=$(brew --prefix)
    if ! fgrep -q "${BREW_PREFIX}/bin/fish" /etc/shells; then
        echo "${BREW_PREFIX}/bin/fish" | sudo tee -a /etc/shells
    fi
    chsh -s "${BREW_PREFIX}/bin/fish"
}

function set_power_management {
    sudo pmset -c sleep 0
}

function setup_1password_cli {
    info "Signing to 1password cli"
    
    read -p "Enter email address for login: " email
    read -p "Enter secret: " secret
    
    TOKEN=$(op signin --raw my.1password.com $email $secret)
    export OP_SESSION_my=$TOKEN
    
    info "signin to onepassword complete"
}

function setup_blog_login {
    info "Setting up blog"
    info "Getting ssh secret for blog"
    
    if [ -e ~/blog ]; then
        warn "blog already setup!"
    else
        mkdir ~/blog
        op get document $FILE_NAME --output ~/blog/blog.pem
        chmod 400 ~/blog/blog.pem
        
        info "blog setup done!"
    fi
}

function copy_required_folders {
    if [ -e ~/.config ]; then
        warn ".config already exists, overwriting files"
        ## accept yes from user to overwrite files
        read -p "Do you want to overwrite files in .config folder? (y/n): " overwrite
        if [ $overwrite == "y" ]; then
            cp -r .config/* ~/.config/
        fi

    else
        cp -r .config/* ~/.config/
    fi
}

function setup_node {
    info "installing node"
    
    fish -c "nvm install 16"
    
    info "Installation of node v16 is complete"
}

copy_required_folders
install_brew_bundles
accept_xcode_license
set_iterm2_profile
setup_shell
generate_ssh_key
set_power_management
# setup_1password_cli
setup_blog_login
setup_node
linkK9SConfigs

info "Mac is setup. Please check for any [WARN] and do the needful and do not forget to check the todo list which need to be setup manually for now. Happy Coding!!!"
info "Restart your cli after this setup"
