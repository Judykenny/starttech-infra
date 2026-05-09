resource "aws_cloudwatch_log_group" "backend" {
  name              = "/starttech/${var.environment}/backend"
  retention_in_days = 30
  tags = { Environment = var.environment }
}

resource "aws_cloudwatch_log_group" "frontend" {
  name              = "/starttech/${var.environment}/frontend"
  retention_in_days = 30
  tags = { Environment = var.environment }
}

resource "aws_iam_role" "ec2_cloudwatch" {
  name = "${var.environment}-ec2-cloudwatch-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "cloudwatch" {
  role       = aws_iam_role.ec2_cloudwatch.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

resource "aws_iam_role_policy_attachment" "ecr_read" {
  role       = aws_iam_role.ec2_cloudwatch.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_role_policy_attachment" "ssm_read" {
  role       = aws_iam_role.ec2_cloudwatch.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess"
}

resource "aws_iam_instance_profile" "ec2_cloudwatch" {
  name = "${var.environment}-ec2-instance-profile"
  role = aws_iam_role.ec2_cloudwatch.name
}
