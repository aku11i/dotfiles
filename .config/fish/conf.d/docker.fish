# Docker
abbr --add --global d 'docker'
# Docker Compose
abbr --add --global dc 'docker compose'

# Docker for Windows
if test (uname -a | grep --ignore-case "Microsoft")
  abbr --add --global docker docker.exe
  abbr --add --global docker-compose docker-compose.exe
end

# lazydocker
abbr --add --global ld 'lazydocker'
