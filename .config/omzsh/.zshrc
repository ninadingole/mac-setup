# ================ Config ==================================

bindkey -e                                             # Use emacs movement bindings
bindkey "^[[1;3C" forward-word                         # Option Forward Arrow
bindkey "^[[1;3D" backward-word                        # Option Back Arrow
setopt globdots                                        # match files starting with .


# ================ Homebrew ================================

eval "$(starship init zsh)"                            # Cross-Shell Prompt
export PATH="$HOME/bin:$PATH"                   # Add local bin to PATH

export K9S_CONFIG_DIR="$HOME/.config/k9s"               # K9s Config

# ================ Aliases ================================

alias df='duf'
