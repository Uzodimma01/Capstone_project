pipeline {
     agent any
     stages {
          stage("Variables setup") {
               steps {
                    script {
                         echo "Setting up variables for the build"
                         env.ami_type = readFile("./variables/ami_type.txt").trim()
                         env.desired_node = readFile("./variables/desired_node.txt").trim()
                         env.tag = readFile("./variables/tag.txt").trim()
                         env.max_node = readFile("./variables/max_node.txt").trim()
                         env.max_surge = readFile("./variables/max_surge.txt").trim()
                         env.max_unavailable = readFile("./variables/max_unavailable.txt").trim()
                         env.min_node = readFile("./variables/min_node.txt").trim()
                         env.name = readFile("./variables/name.txt").trim()
                         env.node_type = readFile("./variables/node_type.txt").trim()
                         env.output_dir = readFile("./variables/output_dir.txt").trim()
                         env.path = readFile("./variables/path.txt").trim()
                         env.pod_replica_set = readFile("./variables/pod_replica_set.txt").trim()
                         env.region = readFile("./variables/region.txt").trim()
                    }
               }
          }
          stage("Build") {
               steps {
                    echo "Building pipeline..."
               }
          }
          stage("Lint files") {
               steps {
                    echo "Linting Dockerfile..."
                    hadolint Dockerfile
                    echo "Linting HTML file..."
                    tidy -q -e index.html
               }
          }
          stage("Build Docker Image") {
               steps {
                    echo "Building Docker image"
               }
          }
     }
}
