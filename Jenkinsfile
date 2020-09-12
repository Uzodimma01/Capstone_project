pipeline {
     agent any
     stages {
          stage("Lint files") {
               steps {
                    echo "Linting HTML file..."
                    sh "tidy -q -e index.html"
                    echo "Linting Dockerfile..."
                    sh "hadolint Dockerfile"
               }
          }
          stage("Variables setup") {
               steps {
                    script {
                         echo "Setting up variables for the build"
                         env.tag = readFile("./variables/tag.txt").trim()
                         env.name = readFile("./variables/name.txt").trim()
                         env.path = readFile("./variables/path.txt").trim()
                         name=env.name
                         tag=env.tag
                         path=env.path
                    }
               }
          }
          stage("Docker image") {
               steps {
                    sh 'echo Building Docker images ...'
                    sh "docker build -t $name:$tag ."
                    sh 'docker image ls'
               }
          }
     }
}
