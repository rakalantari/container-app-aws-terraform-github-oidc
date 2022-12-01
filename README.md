# container-app-aws-terraform-github-oidc

This repository builds infrastructure components required to run containerized app in multiple environments on AWS ECS with Fargate using Terraform and Github Actions.

## How It Works
This repository contains a main branch along with a dedicated branch for each environment. i.e. stage and production. Creating a pull request targeting
each of stage and production branches will trigger a terraform plan against that environment. Merging pull request triggers terraform apply against environment represented by target branch i.e. `terraform apply -auto-approve`.

## AWS resources Created By Terraform
Each workflow creates following AWS resources:
 1. VPC
 2. Security Groups
 3. Access Control List (ACL)
 4. IAM Role
 5. Application Load Balancer
 6. Target Group
 7. ECS Cluster
 8. ECS Service
 9. Autoscaling Group and Policies
 10. Amazon Certificate Manager (ACM)
 
 ## Prerequisites For Using This Repository
 1. AWS Account. If you already don't have an AWS account, you can create one [here](https://portal.aws.amazon.com/billing/signup?nc2=h_ct&src=header_signup&redirect_url=https%3A%2F%2Faws.amazon.com%2Fregistration-confirmation#/start/email).
 2. Create an OpenID Connect Identity Provider for providing AWS access to Github Actions. For more information visit [Creating OpenID Connect (OIDC) identity providers](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_providers_create_oidc.html).
 3. Create S3 buckets supporting terraform backend. You can do so by running `terrafrom apply` inside [prerequisites directory](https://github.com/rakalantari/container-app-aws-terraform-github-oidc/tree/main/prerequisites).
 4. Create action secrets that are utilized inside workflow YAML files. 
