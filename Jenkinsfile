pipeline {
     agent any
     stages {
         stage('Build') {
              steps {
                  sh 'echo Building...'
              }
         }
         stage('Lint files') {
              steps {
                  sh 'bash make_lint.sh'
              }
         }
         stage('Build Docker Image') {
              steps {
                  sh 'bash docker_build.sh'
              }
         }
         stage('Upload Image to DockerHub') {
              steps {
                  withDockerRegistry([url: "", credentialsId: "DockerHub"]) {
                      sh 'bash upload_docker.sh'
                  }
              }
         }
         stage ('Create cluster') {
             steps {
                  echo 'creating cluster ...'
                  withAWS(credentials: 'aws', region: 'us-west-2') {
                      sh 'bash create_cluster.sh'
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
                   echo 'On the way ...'
              } 
        }
        stage("Clean up") {
              steps{
                    echo 'Cleaning up...'
                    sh 'bash docker system prune -f'
              }
        }
     }
}
