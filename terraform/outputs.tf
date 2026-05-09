output "alb_dns_name" {
  value       = module.compute.alb_dns_name
  description = "DNS name of the Application Load Balancer"
}

output "cloudfront_domain" {
  value       = module.storage.cloudfront_domain_name
  description = "CloudFront distribution domain - use this as your frontend URL"
}

output "cloudfront_distribution_id" {
  value       = module.storage.cloudfront_distribution_id
  description = "CloudFront distribution ID - needed for cache invalidation in CI/CD"
}

output "redis_endpoint" {
  value       = module.storage.redis_endpoint
  description = "ElastiCache Redis endpoint"
}

output "frontend_bucket" {
  value       = module.storage.frontend_bucket_name
  description = "S3 bucket name for frontend files"
}

output "backend_log_group" {
  value       = module.monitoring.backend_log_group_name
  description = "CloudWatch log group for backend application"
}
