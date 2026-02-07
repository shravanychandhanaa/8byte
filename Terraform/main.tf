resource "aws_vpc" "shravani_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "shravani_vpc"
  }
}
resource "aws_subnet" "shravani_public_subnet" {
  vpc_id                  = aws_vpc.shravani_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "shravani_public_subnet"
  }
}
resource "aws_internet_gateway" "shravani_igw" {
  vpc_id = aws_vpc.shravani_vpc.id
  tags = {
    Name = "shravani_igw"
  }
}
resource "aws_route_table" "shravani_rt" {
  vpc_id = aws_vpc.shravani_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.shravani_igw.id
  }
  tags = {
    Name = "shravani_rt"
  }
}
resource "aws_route_table_association" "shravani_rta" {
  subnet_id      = aws_subnet.shravani_public_subnet.id
  route_table_id = aws_route_table.shravani_rt.id
}
resource "aws_security_group" "shravani_sg" {
  vpc_id = aws_vpc.shravani_vpc.id
  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "shravani_sg"
  }
}
resource "aws_instance" "shravani_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = aws_subnet.shravani_public_subnet.id
  vpc_security_group_ids = [aws_security_group.shravani_sg.id]
  user_data              = templatefile("${path.module}/shravani.sh", {})
  tags = {
    Name = "shravani_ec2"
  }
}