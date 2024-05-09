function dpa --wraps='docker ps -a' --description 'alias dpa=docker ps -a'
  docker ps -a $argv
        
end
