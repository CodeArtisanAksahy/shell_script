AWS Resource Lister Script
A simple bash script to list resources across various AWS services for a specified region.

Prerequisites 📋
Before you begin, ensure you have the following installed and configured:

AWS Command Line Interface (CLI): The script relies on the AWS CLI to interact with your AWS account. If you don't have it, you can find installation instructions here.

Configured AWS Credentials: Your AWS CLI must be configured with valid credentials that have permission to read the resources you want to list. If you haven't done this, run the following command and follow the prompts:

Bash
aws configure
How to Run 🚀
Make the script executable.
From your terminal, run the following command to give the script permission to execute:

Bash
chmod +x aws_resource_list.sh
Run the script.
Execute the script with the desired AWS region and service name as arguments.

Syntax:

Bash
./aws_resource_list.sh <aws_region> <service_name>
Example:
To list all EC2 instances in the us-east-1 region:

Bash
./aws_resource_list.sh us-east-1 ec2
Supported Services 🛠️
The script accepts the following service names (case-insensitive):

ec2

s3

rds

cloudfront

vpc

iam

route53

cloudwatch

cloudformation

lambda

sns

sqs

dynamodb

ebs
