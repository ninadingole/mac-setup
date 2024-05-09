function dip --wraps=docker\ inspect\ --format\ \'\{\{\ .NetworkSettings.IPAddress\ \}\}\' --description alias\ dip=docker\ inspect\ --format\ \'\{\{\ .NetworkSettings.IPAddress\ \}\}\'
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' $argv
        
end
