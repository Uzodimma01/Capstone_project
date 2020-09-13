pipeline {
     agent any
     stages {
          script{
               echo "Setting up variables for the build"
               export env.tag = readFile("variables/tag.txt").trim()
               export env.name = readFile("variables/name.txt").trim()
               export env.path = readFile("variables/path.txt").trim()
               export name="${env.name}"
               export tag="${env.tag}"
               export path="${env.path}"
               export lo="name"
          }
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
               echo "testing"     
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
