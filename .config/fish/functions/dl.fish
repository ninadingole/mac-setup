function dl --wraps='docker ps -l -q' --description 'alias dl=docker ps -l -q'
  docker ps -l -q $argv
        
end
