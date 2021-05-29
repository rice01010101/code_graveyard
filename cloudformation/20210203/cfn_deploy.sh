#! /bin/bash

CHANGESET_OPTION="--no-execute-changeset"

if [ $# = 1 ] && [ $1 = "deploy" ]; then
  echo "deploy mode"
  CHANGESET_OPTION=""
fi

# 実行するcnfテンプレートの指定と作成するstack名の定義
CNF_TEMPLATE=/home/ec2-user/environment/CloudFormation/prod/00-index_packaged.yml
CNF_PACKAGE_TEMPLATE=/home/ec2-user/environment/CloudFormation/prod/00-index.yml
CNF_STACK_NAME=REPLACE_YOUR_STACK_NAME
CFN_S3_BUCKETNAME4TEMPLATE=REPLACE_YOUR_S3_BUCKET_NAME

# s3にアップロードしテンプレートパスを変換する
aws cloudformation package --template-file ${CNF_PACKAGE_TEMPLATE} --s3-bucket ${CFN_S3_BUCKETNAME4TEMPLATE} --output-template-file ${CNF_TEMPLATE}
aws cloudformation deploy --stack-name ${CNF_STACK_NAME} --template-file ${CNF_TEMPLATE} ${CHANGESET_OPTION} --capabilities CAPABILITY_NAMED_IAM
#--parameter-overrides \
#NameTagPrefix=prd \
#VPCCIDR=10.100