terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "starttech-terraform-state-776793512817"
    key    = "production/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}

module "networking" {
  source      = "./modules/networking"
  environment = var.environment
}

module "monitoring" {
  source      = "./modules/monitoring"
  environment = var.environment
  asg_name    = module.compute.asg_name
}

module "compute" {
  source               = "./modules/compute"
  environment          = var.environment
  vpc_id               = module.networking.vpc_id
  public_subnet_ids    = module.networking.public_subnet_ids
  private_subnet_ids   = module.networking.private_subnet_ids
  alb_sg_id            = module.networking.alb_sg_id
  backend_sg_id        = module.networking.backend_sg_id
  ami_id               = var.ami_id
  key_name             = var.key_name
  instance_type        = var.instance_type
  iam_instance_profile = module.monitoring.ec2_instance_profile
}

module "storage" {
  source             = "./modules/storage"
  environment        = var.environment
  bucket_name        = var.bucket_name
  alb_dns_name       = module.compute.alb_dns_name
  private_subnet_ids = module.networking.private_subnet_ids
  redis_sg_id        = module.networking.redis_sg_id
}
