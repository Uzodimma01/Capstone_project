eksctl create cluster \
 --name $(<./variables/name.txt) \
 --version 1.17 \
 --without-nodegroup
 
 # This is not part of a standard 
 # create cluster syntax
 
 # create a dir to write files to
 mkdir -p /tmp/jenkins_build
 # Write cluster ARN to file
 aws cloudformation describe-stacks \
 --region $(<region.txt) --stack-name $(<name.txt) \
 --query "Stacks[0].Outputs[?OutputKey=='ARN'].OutputValue" \
 --output text>/tmp/jenkins_build/ARN.txt
