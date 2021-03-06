#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Step 1:
# Create dockerpath
dockerpath=$(<./variables/path.txt)/$(<./variables/name.txt):$(<./variables/docker_image_tag.txt)
local_tag=$(<./variables/name.txt):$(<./variables/docker_image_tag.txt)
docker tag $local_tag $dockerpath


# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker push $dockerpath
