docker rm --force $(docker ps -qa)
docker volume rm $(docker volume ls -q --filter dangling=true)
docker network prune --force
