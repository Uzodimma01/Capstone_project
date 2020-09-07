#!/usr/bin/env bash

# Step 1:
# This is your Docker ID/path
dockerpath=$(<./variables/docker_path):latest
dockerimage=$(<./variables/docker_image_name)

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run $dockerimage\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=$dockerimage

# Wait for pod creation to complete
sleep 20s

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl expose deployment $dockerimage --type=LoadBalancer --port=80

# Wait for service creation to complete
sleep 20s

kubectl get services
