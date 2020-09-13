pipeline {
     agent any
     stages {
          stage("Lint files") {
               steps {
                    echo "Linting HTML file..."
                    sh "tidy -q -e index.html"
                    echo "Linting Dockerfile..."
                    sh "hadolint Dockerfile"
                    sh "pwd"
               }
          }
          stage("Variables setup") {
               steps {
                    sh "bash variables_setup.sh"
               }
          }
          stage("Docker image build") {
               steps {
                    echo "$pwd"
                    echo "Hello Docker"
                    echo "$pwd"
                    echo "Hello $name"
                    echo "$pwd"
               }
          }
     }
}
