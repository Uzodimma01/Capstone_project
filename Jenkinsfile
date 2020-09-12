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
                    script {
                         echo "Setting up variables for the build"
                         sh "pwd"
                         env.tag = readFile("./variables/tag.txt").trim()
                         env.name = readFile("./variables/name.txt").trim()
                         env.path = readFile("./variables/path.txt").trim()
                         sh "pwd"
                         name="${env.name}"
                         tag="${env.tag}"
                         path="${env.path}"
                         sh "pwd"
                         lo="name"
                         sh "pwd"
                    }
               }
          }
          stage("Docker image build") {
               steps {
                    sh "pwd"
                    echo "Hello Docker"
                    sh "pwd"
                    echo "Hello $name"
                    sh "pwd"
               }
          }
     }
}
