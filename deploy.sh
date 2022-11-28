#!/bin/sh

# ---------------------------------------
# Deploy initial S3 bucket to store macro
# ---------------------------------------
aws cloudformation deploy \
    --stack-name            macros-bucket \
    --template-file         s3-macros.yaml \
    --region                ap-southeast-2

# --------------
# Install Macros
# --------------
cd S3Objects || exit

aws cloudformation package \
    --template-file         macro.template \
    --s3-bucket             aws-s3-bucket-macros \
    --output-template-file  packaged.template

aws cloudformation deploy \
    --stack-name            s3objects-macro \
    --template-file         packaged.template \
    --capabilities          CAPABILITY_IAM \
    --region                ap-southeast-2

rm packaged.template

cd ..

# -------------------------------
# Install Hello World Application
# -------------------------------
aws cloudformation deploy \
    --stack-name            s3-objects \
    --template-file         s3-objects.yaml \
    --region                ap-southeast-2
