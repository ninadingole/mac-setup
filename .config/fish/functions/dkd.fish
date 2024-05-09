function dkd --wraps='docker run -d -P' --description 'alias dkd=docker run -d -P'
  docker run -d -P $argv
        
end
