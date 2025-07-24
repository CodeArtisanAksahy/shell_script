#!/bin/bash

# This script will return all the available resources in aws
# Author: Akshay Thakur
# version: v.0.0.1
# Supported services :
# 1. EC2
# 2. S3
# and many more

# Usage : ./aws_resources_list.sh <region> <service_name>
# Example : ./aws_resources_list.sh us-east-1 EC2

# FIX 1: Added spaces inside the brackets and used a semicolon.
if [ $# -ne 2 ]; then # The $# means number of command line arguments
    echo "Usage: $0 <region> <service_name>"
    exit 1
fi

# check if AWS CLI Installed or not

if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it first."
    exit 1
fi

# check if the aws cli is configured

# FIX 2: Added a space after '[' and moved '!' inside.
if [ ! -d ~/.aws ]; then
    echo "AWS CLI is not configured. Please run 'aws configure'."
    exit 1
fi

aws_region=$1
aws_service=$(echo "$2" | tr '[:upper:]' '[:lower:]')

case $aws_service in
    ec2)
        echo "Listing EC2 Instances in $aws_region"
        aws ec2 describe-instances --region $aws_region
        ;;
    rds)
        echo "Listing RDS Instances in $aws_region"
        aws rds describe-db-instances --region $aws_region
        ;;
    s3)
        # Note: S3 buckets are global, but the command requires a region for the API endpoint.
        echo "Listing S3 Buckets"
        aws s3api list-buckets --query "Buckets[].Name" --output text
        ;;
    cloudfront)
        echo "Listing CloudFront Distributions"
        aws cloudfront list-distributions
        ;;
    vpc)
        echo "Listing VPCs in $aws_region"
        aws ec2 describe-vpcs --region $aws_region
        ;;
    iam)
        # Note: IAM is a global service.
        echo "Listing IAM Users"
        aws iam list-users
        ;;
    route53)
        echo "Listing Route53 Hosted Zones"
        aws route53 list-hosted-zones
        ;;
    cloudwatch)
        echo "Listing CloudWatch Alarms in $aws_region"
        aws cloudwatch describe-alarms --region $aws_region
        ;;
    cloudformation)
        echo "Listing CloudFormation Stacks in $aws_region"
        aws cloudformation describe-stacks --region $aws_region
        ;;
    lambda)
        echo "Listing Lambda Functions in $aws_region"
        aws lambda list-functions --region $aws_region
        ;;
    sns)
        echo "Listing SNS Topics in $aws_region"
        aws sns list-topics --region $aws_region
        ;;
    sqs)
        echo "Listing SQS Queues in $aws_region"
        aws sqs list-queues --region $aws_region
        ;;
    dynamodb)
        echo "Listing DynamoDB Tables in $aws_region"
        aws dynamodb list-tables --region $aws_region
        ;;
    ebs)
        echo "Listing EBS Volumes in $aws_region"
        aws ec2 describe-volumes --region $aws_region
        ;;
    *)
        echo "Invalid service. Please enter a valid service."
        exit 1
        ;;
esac
# ... the rest of your case statement follows