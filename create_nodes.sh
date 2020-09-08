eksctl create nodegroup \
--cluster my-cluster \
--version auto \
--name $(<./variables/name.txt) \
--region $(<./variables/region.txt) \
--node-type $(<./variables/node_type.txt) \
--node-ami $(<./variables/ami_type.txt) \
--nodes $(<./variables/desired_node.txt) \
--nodes-min $(<./variables/min_node.txt) \
--nodes-max $(<./variables/max_node.txt)
