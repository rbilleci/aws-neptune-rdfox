#!/bin/bash

CFN_ACCOUNT=$(aws sts get-caller-identity --query Account --output text)
CFN_REGION=$(aws configure get region)

aws cloudformation deploy --template-file template-ecr.yaml --capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM --stack-name rdfox-ecr

docker build -t rdfox .
CFN_TAG=$(docker images rdfox -q)
aws ecr get-login-password --region ${CFN_REGION} | docker login --username AWS --password-stdin ${CFN_ACCOUNT}.dkr.ecr.${CFN_REGION}.amazonaws.com
docker tag ${CFN_TAG} ${CFN_ACCOUNT}.dkr.ecr.${CFN_REGION}.amazonaws.com/rdfox
docker push ${CFN_ACCOUNT}.dkr.ecr.${CFN_REGION}.amazonaws.com/rdfox