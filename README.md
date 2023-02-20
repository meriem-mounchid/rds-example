# rds-example

This is to set up wordpress using AWS infrastructure. We are using terraform to provision infrastructure. Code uses and creates following aws services.

1. VPC.
2. Subnets.
3. Security Groups.
4. EC2 instance.
5. RDS mariadb instance.

## Note:
You may get charged by aws for using services

## Pre-requisite:
You need to create an IAM user and create security credentials(AccessKey, SecretKey) and update in the ~/.aws/credentials file 

## Usage:
### provisioning:
1. git clone https://github.com/meriem-mounchid/rds-example.git rds-example
2. cd rds-example (Be in the repo directory)
3. terraform init
4. terraform plan
5. terraform apply -auto-approve

### Destroying the Infra:
1. cd rds-example (Be in the repo directory)
2. terraform destroy -auto-approve
