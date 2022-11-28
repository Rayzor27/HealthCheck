#!/bin/sh

aws s3 rm s3://hello-world-displayr-dummy-server --recursive
aws s3 rm s3://aws-s3-bucket-macros --recursive

aws cloudformation delete-stack \
    --stack-name    macros-bucket \
    --output        text

aws cloudformation delete-stack \
    --stack-name    s3objects-macro \
    --output        text

aws cloudformation delete-stack \
    --stack-name    s3-objects \
    --output        text
