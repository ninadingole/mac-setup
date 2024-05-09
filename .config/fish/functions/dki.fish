function dki --wraps='docker run -i -t -P' --description 'alias dki=docker run -i -t -P'
  docker run -i -t -P $argv
        
end
