sh 'echo "Setting up variables for the build"'
sh 'env.ami_type = readFile("./variables/ami_type.txt").trim()'
sh 'env.desired_node = readFile("./variables/desired_node.txt").trim()'
sh 'env.tag = readFile("./variables/tag.txt").trim()'
sh 'env.max_node = readFile("./variables/max_node.txt").trim()'
sh 'env.max_surge = readFile("./variables/max_surge.txt").trim()'
sh 'env.max_unavailable = readFile("./variables/max_unavailable.txt").trim()'
sh 'env.min_node = readFile("./variables/min_node.txt").trim()'
sh 'env.name = readFile("./variables/name.txt").trim()'
sh 'env.node_type = readFile("./variables/node_type.txt").trim()'
sh 'env.output_dir = readFile("./variables/output_dir.txt").trim()'
sh 'env.path = readFile("./variables/path.txt").trim()'
sh 'env.pod_replica_set = readFile("./variables/pod_replica_set.txt").trim()'
sh 'env.region = readFile("./variables/region.txt").trim()'
