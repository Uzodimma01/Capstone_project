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
                  sh 'bash lint.sh'
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
                  withAWS(credentials: 'AWS', region: 'us-west-2') {
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
                   echo 'Deploying app to AWS ...'
                   withAWS(credentials: 'AWS', region: 'us-west-2') {
                        sh 'bash kubernetes.sh'
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
