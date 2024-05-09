#!/usr/bin/fish

# Get latest container ID
alias dl="docker ps -l -q"
funcsave dl

# Get container process
alias dps="docker ps"
funcsave dps

# Get process included stop container
alias dpa="docker ps -a"
funcsave dpa

# Get images
alias di="docker images"
funcsave di

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
funcsave dip

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"
funcsave dkd

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"
funcsave dki

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"
funcsave dex

# Stop all containers
function dstop
    docker stop (docker ps -a -q)
end
funcsave dstop

# Remove all containers
function drm
    docker rm (docker ps -a -q)
end
funcsave drm

# Stop and Remove all containers
alias drmf='docker stop (docker ps -a -q) ; docker rm (docker ps -a -q)'
funcsave drmf

# Remove all images
function dri
    docker rmi (docker images -q)
end

# Dockerfile build, e.g., $dbu tcnksm/test 
function dbu
    docker build -t=$1 .
end

# Show all alias related docker
function dalias
    alias | grep docker | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/" | sed "s/['|\']//g" | sort
end

# Bash into running container
function dbash
    docker exec -it (docker ps -aqf "name=$1") bash
end
