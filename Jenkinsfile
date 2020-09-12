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
                         env.tag = readFile("./variables/tag.txt").trim()
                         env.name = readFile("./variables/name.txt").trim()
                         env.path = readFile("./variables/path.txt").trim()
                         name="${env.name}"
                         tag="${env.tag}"
                         path="${env.path}"
                         lo="name"
                    }
               }
          }
          stage("Docker image build") {
               steps {
                    echo "Hello Docker"
                    sh "pwd"
                    echo "Hello $name"
               }
          }
     }
}
