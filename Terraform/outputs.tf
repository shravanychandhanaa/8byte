output "ec2_public_ip" {
  description = "EC2 instance PUBLIC IP"
  value       = aws_instance.shravani_ec2.public_ip
}
output "ec2_instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.shravani_ec2.id
}
output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.shravani_vpc.id
}