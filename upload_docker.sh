#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Step 1:
# Create dockerpath
dockerpath=$(<./variables/docker_path.txt)
local_tag=$(<./variables/docker_image_name.txt):latest
docker tag $local_tag $dockerpath


# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker push $dockerpath
