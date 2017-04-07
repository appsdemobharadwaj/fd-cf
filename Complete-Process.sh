#!/bin/sh
aws cloudformation create-stack --stack-name CreateStack-CFN --template-body file:///home/ec2-user/fd-cf/fd-cf/CreateStack-CFN.json

for i in {1..30}
do
 /bin/sleep 1
 echo $i
done

aws cloudformation describe-stacks --stack-name CreateStack-CFN list-exports >> ResourceDetailInStack.json

git add .

git commit -m 'generated output json file'

git push origin master
