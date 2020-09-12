pipeline {
     agent any
     stages {
          stage("Variables setup") {
               steps {
                    sh "bash variables.sh"
               }
          }
          stage("Lint files") {
               steps {
                    echo "Linting HTML file..."
                    sh "tidy -q -e index.html"
                    echo "Linting Dockerfile..."
                    sh "hadolint Dockerfile"
               }
          }
//          stage("Docker image") {
//               steps {
//                    sh 'echo Building Docker image ...'
//                    sh "docker build -t ${env.name}:${env.tag} ."
//                    sh 'docker image ls'
//               }
//          }
     }
}
