region             = "ap-south-1"
vpc_cidr           = "10.0.0.0/24"
public_subnet_cidr = "10.0.0.0/28"
instance_type      = "t2.micro"
key_name           = "MENTION_YOUR_PEM_KEY_NAME"
ami_id             = "ami-087d1c9a513324697"
ports              = [22, 3000]
availability_zone  = "ap-south-1a"