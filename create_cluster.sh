##eksctl create cluster \
## --name $(<./variables/name.txt) \
## --version 1.17 \
## --without-nodegroup
 
 # This is not part of a standard 
 # create cluster syntax
 
 # create a dir to write files to
## mkdir -p /tmp/jenkins_build
 # Write cluster ARN to file
 aws cloudformation describe-stacks \
  --region $(<./variables/region.txt) --stack-name eksctl-$(<./variables/name.txt)-cluster --query "Stacks[0].Outputs[?OutputKey=='ARN'].OutputValue" \
   # prefixed "eksctl" and appended "cluster" to match cloudformation describe-stack StackName naming pattern 
  --output text>/tmp/cluster_ARN.txt
  
 cat /tmp/cluster_ARN.txt
