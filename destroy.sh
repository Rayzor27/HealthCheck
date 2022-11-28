#!/bin/sh

aws cloudformation delete-stack \
    --stack-name    aws-s3-bucket-macros \
    --output        text

aws cloudformation delete-stack \
    --stack-name    s3objects-macro \
    --output        text

aws cloudformation delete-stack \
    --stack-name    s3-objects \
    --output        text