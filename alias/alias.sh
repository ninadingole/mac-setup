#!/usr/bin/zsh

# general use
alias ls='exa'                                                          # ls
alias l='exa -lbF --git'                                                # list, size, type, git
alias ll='exa -lbGF --no-permission --no-time --no-user --git'                                             # long list
alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

# specialty views
alias lS='exa -1'                                                              # one column, just names
alias lt='exa --tree --level=2'                                         # tree

## 1password cli
alias 1passlogin='eval (op signin my)'

## blog
alias loginblog='ssh -i ~/blog/blog.pem ubuntu@$BLOG_INSTANCE'

alias testwatch='goconvey -cover -excludedDirs "ci,ahoy,vendor,terraform,bin"'
alias gp='git push && hellofreshPrCreate'

alias kafkaget='sh /Users/neenadingole/kafka-get.shi'
#alias docker='podman'
alias px='pet exec'
alias shell-po="kubectl exec -it $(eval kubectl get pods -A -l app=process-orchestrator-cli --namespace consumer-core --no-headers | awk '{print $2}') -- bash"
alias dx="lazydocker"
alias gitx="lazygit"

# general use
alias cl='clear'
alias ls='exa --icons'                                                          # ls
alias l='exa -lbF --git'                                                # list, size, type, git
alias ll='exa -l --no-permissions --no-time --no-user --no-filesize --git'                                             # long list
alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list

# K8s
alias krr='kubectl rollout restart'

# specialty views
alias lS='exa -1'                                                       # one column, just names
alias lt='exa --tree --level=2'

# nvim
alias vi='nvim'

# better cat
alias cat='bat'
