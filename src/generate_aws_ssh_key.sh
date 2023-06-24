#!/usr/bin/sh

brew install awscli

ssh-keygen -t ed25519 -f christys_aws_key

# The key is protected using the password from my AWS IAM account

aws ec2-instance-connect send-ssh-public-key \
    --region us-east-2 \
    --availability-zone us-east-2 \
    --instance-id i-0ae32b31ef38995b6 \
    --instance-os-user ubuntu \
    --ssh-public-key file://christys_aws_key.pub
