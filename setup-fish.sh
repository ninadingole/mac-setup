#!/bin/bash

source logger.sh

FISH_CONFIG=~/.config/fish
OMF_CONFIG=~/.config/omf

function setup_fisher {
    info "Setting fisher plugin manager"
    
    if [ -e $FISH_CONFIG/functions/fisher.fish ] && [ -e $FISH_CONFIG/completions/fisher.fish ]; then
        warn "fisher already exists"
    else
        curl -sL "https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish" > $FISH_CONFIG/functions/fisher.fish
        curl -sL "https://raw.githubusercontent.com/jorgebucaran/fisher/main/completions/fisher.fish" > $FISH_CONFIG/completions/fisher.fish
    fi
}

function setup_omf {
    info "Setting OMF manager"
    
    if fish -c "omf version"; then
        warn "OMF already exists"
    else
        curl -L https://get.oh-my.fish | fish
        fish -c "omf update"
        
        info "Setting up Bundles and themes"
        
        ln -s $PWD/fish/omf/bundle $OMF_CONFIG/bundle
        ln -s $PWD/fish/omf/theme $OMF_CONFIG/theme
        
        fish -c "omf update"
    fi
}

function setup_paths {
    info "Setting path variables"
    
    if [ -e $FISH_CONFIG/conf.d/paths.fish ]; then
        warn "Skipping symlink as paths.fish already exist"
    else
        ln -s $PWD/fish/paths.fish $FISH_CONFIG/conf.d/paths.fish
    fi
}

function setup_aliases {
    info "Setting Aliases"
    
    shopt -s nullglob
    for i in `find ./fish -name "*.fish" -exec basename {} \;`; do
        if [ -e $FISH_CONFIG/conf.d/$i ]; then
            warn "Skipping symlink as $i already exist"
        else
            ln -s $PWD/fish/$i $FISH_CONFIG/conf.d/$i
        fi
    done
}

setup_fisher
setup_omf
setup_paths
setup_aliases

info "Fish Setup complete"
