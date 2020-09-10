#!/usr/bin/env bash

# Step 1:
# Build image and add a descriptive tag
docker build --tag=$(<./variables/name.txt):$(<./variables/docker_image_tag.txt) .

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run app
docker run -it --rm -d -p 80:80 $(<./variables/name.txt):$(<./variables/docker_image_tag.txt)>/tmp/docker_container_Id.txt
cat /tmp/docker_container_Id.txt
