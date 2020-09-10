#!/usr/bin/env bash

## Step 1:
## This is your Docker ID/path
dockerpath=$(<./variables/path.txt):$(<./variables/docker_image_tag.txt)
dockerimage=$(<./variables/name.txt)
echo "created image and path"

## Step 2
## Run the Docker Hub container with kubernetes
#kubectl run $dockerimage\
#    --generator=run-pod/v1\
#    --image=$dockerpath\
#    --port=80 --labels app=$dockerimage

aws eks --region $(<./variables/region.txt) update-kubeconfig --name $(<./variables/name.txt)
echo "config updated"
kubectl config use-context $(</tmp/cluster_ARN.txt)
echo "context used"
kubectl set image deployments/$(<./variables/name.txt) $(<./variables/name.txt)=$(<./variables/path.txt):$(<./variables/docker_image_tag.txt)
echo "image set"
kubectl apply -f ./deployment.yml
echo "applied template"
# Wait for pod creation to complete
sleep 20s

# Step 3:
# List kubernetes pods
kubectl get pods
echo "acquired pods"

# Step 4:
# Forward the container port to a host
kubectl expose deployment $dockerimage --type=LoadBalancer --port=80
echo "exposed deployment"

# Wait for service creation to complete
sleep 20s

kubectl get services
echo "listed services"

echo "Complete"
