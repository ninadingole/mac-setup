function drmf --wraps='docker stop (docker ps -a -q) ; docker rm (docker ps -a -q)' --description 'alias drmf=docker stop (docker ps -a -q) ; docker rm (docker ps -a -q)'
  docker stop (docker ps -a -q) ; docker rm (docker ps -a -q) $argv
        
end
