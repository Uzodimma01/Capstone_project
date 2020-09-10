eksctl create nodegroup \
--cluster $(<./variables/name.txt) \
--version auto \
--name $(<./variables/name.txt) \
--region $(<./variables/region.txt) \
--node-type $(<./variables/node_type.txt) \
--node-ami $(<./variables/ami_type.txt) \
--nodes $(<./variables/desired_node.txt) \
--nodes-min $(<./variables/min_node.txt) \
--nodes-max $(<./variables/max_node.txt) \
#--ssh-access \
#--ssh-public-key $(<./variables/access_key.txt)

 # This is not part of a standard 
 # create cluster syntax
 
 # create a dir to write files to
 mkdir -p /tmp/jenkins_build
 # Write cluster ARN to file
 aws cloudformation describe-stacks \
  --region $(<./variables/region.txt) --stack-name eksctl-$(<./variables/name.txt)-nodegroup-$(<./variables/name.txt) --query "Stacks[0].Outputs[?OutputKey=='ARN'].OutputValue"  --output text>/tmp/cluster_ARN.txt
 # prefixed "eksctl" and appended "cluster" to match cloudformation describe-stack StackName naming pattern 
  
 cat /tmp/cluster_ARN.txt

