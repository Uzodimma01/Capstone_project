docker ps
docker stop $(</tmp/docker_container_Id.txt)
docker system prune -y
