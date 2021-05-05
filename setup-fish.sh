#!/bin/bash

# Exit when any command fails
set -e

source logger.sh

FISH_CONFIG=~/.config/fish

function setup_fisher {
    info "Setting fisher plugin manager"
    
    curl -sL "https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish" > $FISH_CONFIG/functions/fisher.fish
    curl -sL "https://raw.githubusercontent.com/jorgebucaran/fisher/main/completions/fisher.fish" > $FISH_CONFIG/completions/fisher.fish
}

function setup_omf {
    curl -L https://get.oh-my.fish | fish
}

function setup_paths {
    info "Setting path variables"
    ln -s $PWD/fish/paths.fish ~/.config/fish/conf.d/paths.fish
}

function setup_aliases {
    info "Setting Aliases"
    ln -s $PWD/fish/alias.fish ~/.config/fish/conf.d/alias.fish
    ln -s $PWD/fish/git.alias.fish ~/.config/fish/conf.d/git.alias.fish
    ln -s $PWD/fish/k8s.alias.fish ~/.config/fish/conf.d/k8s.alias.fish
    ln -s $PWD/fish/docker.alias.fish ~/.config/fish/conf.d/docker.alias.fish
}

# setup_fisher
# setup_omf
setup_paths
setup_aliases

info "Fish Setup complete"
