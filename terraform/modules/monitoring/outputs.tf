output "backend_log_group_name"  { value = aws_cloudwatch_log_group.backend.name }
output "frontend_log_group_name" { value = aws_cloudwatch_log_group.frontend.name }
output "ec2_instance_profile"    { value = aws_iam_instance_profile.ec2_cloudwatch.name }
