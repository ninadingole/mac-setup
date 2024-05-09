function dex --wraps='docker exec -i -t' --description 'alias dex=docker exec -i -t'
  docker exec -i -t $argv
        
end
