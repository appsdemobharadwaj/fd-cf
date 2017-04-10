#!/bin/sh
aws cloudformation create-stack --stack-name CreateStack-CFN1 --template-body file:///home/ec2-user/fd-cf/fd-cf/CreateStack-CFN.json

echo "Please wait Stack Creation In Progress ... "

for i in {1..30}
do
 /bin/sleep 2
 echo -ne "."
done

aws cloudformation describe-stacks --stack-name CreateStack-CFN1 > ResourceDetailInStack.json

git add .

git commit -m 'generated output json file'

git push origin master
