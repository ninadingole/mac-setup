#!/bin/bash

source logger.sh

FISH_CONFIG=~/.config/fish
OMF_CONFIG=~/.config/omf

function setup_fisher {
    info "Setting fisher plugin manager"
    
    if [ -e $FISH_CONFIG/functions/fisher.fish ] && [ -e $FISH_CONFIG/completions/fisher.fish ]; then
        warn "fisher already exists"
    else
        mkdir -p $FISH_CONFIG
        curl -sL "https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish" > $FISH_CONFIG/functions/fisher.fish
        curl -sL "https://raw.githubusercontent.com/jorgebucaran/fisher/main/completions/fisher.fish" > $FISH_CONFIG/completions/fisher.fish
        
        fish -c "fisher update"
    fi
}



setup_fisher

info "Fish Setup complete"
