pipeline {
     agent any
     stages {
         stage('Build') {
              steps {
                  sh 'echo Building...'
              }
         }
         stage('Lint files') { // This stage lints the Dockerfile and the HTML file
              steps {
                   sh 'hadolint Dockerfile' // Lint the Dockerfile using Hadolint
                   sh 'tidy -q -e index.html' // Lint the HTML file using Tidy
              }
         }
         stage('Build Docker Image') { // This stage builds the Docker image
              steps {
                   echo 'Building Docker image ...'
                   sh 'docker build --tag=test:new .'// Build Docker image with the content of the .txt files in the 'variables' folder
                   sh 'docker image ls'
              }
         }
         stage('Upload Image to DockerHub') { // This stage tags and uploads an image to Docker Hub
              steps {
                  echo 'Uploading image to DockerHub ...'
                  withDockerRegistry([url: "", credentialsId: "DockerHub"]) {
                       sh 'dockerpath=uzodimma/test:new' // Create dockerpath
                       sh 'local_tag=test:new'
                       sh 'docker tag $local_tag $dockerpath'
                       sh 'echo "Docker ID and Image: $dockerpath"' // Authenticate and tag the docker image
                       sh 'docker push $dockerpath' // Push the docker image to Docker registery
                  }
              }
         }
         stage ('Create cluster') {
             steps {
                  echo 'creating cluster ...'
                  withAWS(credentials: 'AWS', region: 'us-west-2') {
                       sh 'eksctl create cluster --name $(<./variables/name.txt) --version 1.17 --without-nodegroup'
                       sh 'get_cluster_ARN.sh'
                  }
             }
         }
         stage ('Create nodes') {
             steps {
                  echo 'creating nodes ...'
                  withAWS(credentials: 'AWS', region: 'us-west-2') {
                      sh 'bash create_nodes.sh'
                  }
             }
         }
         stage('Deploy') {
              steps {
                   echo 'Deploying app to AWS ...'
                   withAWS(credentials: 'AWS', region: 'us-west-2') {
                        sh 'dockerpath=$(<./variables/path.txt):$(<./variables/docker_image_tag.txt)'
                        sh 'dockerimage=$(<./variables/name.txt)'
                        sh 'aws eks --region $(<./variables/region.txt) update-kubeconfig --name $(<./variables/name.txt)'
                        sh 'kubectl config use-context $(</tmp/cluster_ARN.txt)'
                        sh 'kubectl set image deployments/$(<./variables/name.txt) $(<./variables/name.txt)=$(<./variables/path.txt):$(<./variables/docker_image_tag.txt)'
                        sh 'kubectl apply -f ./deployment.yml'
                        sh 'sleep 20s' // Wait for 20 seconds before proceeding to enable pod service to come up
                        sh 'kubectl get services'
                   }
              } 
        }
        stage("Clean up") {
              steps{
                    echo 'Cleaning up...'
                    sh 'bash clean_up.sh'
              }
        }
     }
}
