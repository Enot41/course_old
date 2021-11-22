#bin/bash
docker stop $(docker ps -q)
docker rm $(docker ps -a -f status=exited -q)
docker rm $(docker ps -a -q)
#docker rm $(docker ps -a)
docker rmi -f $(docker images -a -q)
docker volume rm $(docker volume ls -q)
docker ps -a
docker images
docker volume ls
