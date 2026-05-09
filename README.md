# StartTech Infrastructure

Complete AWS infrastructure for the StartTech application, managed with Terraform.

## Architecture Overview

- Frontend: React app served via S3 + CloudFront CDN
- Backend: Golang API on EC2 instances behind an Application Load Balancer
- Caching: ElastiCache Redis cluster
- Database: MongoDB Atlas
- Infrastructure: Terraform with modular structure
- CI/CD: GitHub Actions

## Infrastructure Components

| Component | Details |
|---|---|
| VPC | 10.0.0.0/16 with public and private subnets across 2 AZs |
| ALB | production-alb-644936730.us-east-1.elb.amazonaws.com |
| CloudFront | d7o1972s2ptl5.cloudfront.net |
| S3 Bucket | starttech-frontend-judykenny-2024 |
| Redis | production-redis.uakbsz.0001.use1.cache.amazonaws.com |
| ASG | Min: 1, Max: 3, Desired: 2 instances |

## Prerequisites

- Terraform >= 1.6.0
- AWS CLI configured
- S3 state bucket: starttech-terraform-state-776793512817

## Deployment

cd terraform
terraform init
terraform plan
terraform apply

## GitHub Secrets Required

| Secret | Description |
|---|---|
| AWS_ACCESS_KEY_ID | AWS IAM access key |
| AWS_SECRET_ACCESS_KEY | AWS IAM secret key |
| AMI_ID | Amazon Linux 2 AMI ID |
| KEY_NAME | EC2 key pair name |
