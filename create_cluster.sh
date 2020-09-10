eksctl create cluster \
 --name $(<./variables/name.txt) \
 --version 1.17 \
 --without-nodegroup
