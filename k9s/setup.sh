

K9S_CONF_DIR=$HOME/.config/k9s

function linkK9SConfigs {
    info "linking k9s config"
    
    if [ -e $K9S_CONF_DIR/config.yml ]; then
        warn "Skipping symlink as k9s configs already exist"
    else
        info "creating k9s config directory and linking files"
        mkdir -p $K9S_CONF_DIR
        ln -sf $PWD/k9s/config.yml $K9S_CONF_DIR/config.yml;
        
        ln -sf $PWD/k9s/hotkey.yml $K9S_CONF_DIR/hotkey.yml;
    fi
}
