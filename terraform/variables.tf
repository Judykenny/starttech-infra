variable "environment" {
  type    = string
  default = "production"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ami_id" {
  type        = string
  description = "Amazon Linux 2 AMI ID for EC2 instances"
}

variable "key_name" {
  type        = string
  description = "EC2 key pair name"
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name for frontend (must be globally unique)"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}
