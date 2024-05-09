function drm
    docker rm (docker ps -a -q)
end
