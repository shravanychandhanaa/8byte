variable "region" {
  description = "deploys the infrastructure in this region"
  type        = string
}
variable "vpc_cidr" {
  description = "creates a vpc with the cidr provided"
  type        = string
}
variable "public_subnet_cidr" {
  description = "created a public subnet in the vpc provided"
  type        = string
}
variable "instance_type" {
  description = "the instance type of ec2"
  type        = string
}
variable "key_name" {
  description = "ssh key name for authentication"
  type        = string
}
variable "ami_id" {
  description = "ubuntu 22.04 ami id for the specified region"
  type        = string
}
variable "ports" {
  description = "allows access to particular port numbers"
  type        = list(number)
}
variable "availability_zone" {
  description = "creates the resource in the region's availability zone"
  type        = string
}