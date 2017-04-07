#!/bin/sh
aws cloudformation create-stack --stack-name CreateStack-CFN --template-body file:///home/ec2-user/fd-cf/fd-cf/CreateStack-CFN.json

/bin/sleep 10

aws cloudformation list-stack-resources --stack-name CreateStack-CFN list-exports >> ResourceDetailInStack.json

git add .

git commit -m 'generated output json file'

git push origin master
