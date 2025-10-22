# ----------------------------
# Terraform Main Configuration
# ----------------------------

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# ----------------------------
# VPC and Networking
# ----------------------------
resource "aws_vpc" "devops_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "DevOpsVPC"
  }
}

resource "aws_subnet" "devops_subnet" {
  vpc_id                  = aws_vpc.devops_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "DevOpsSubnet"
  }
}

resource "aws_internet_gateway" "devops_igw" {
  vpc_id = aws_vpc.devops_vpc.id
  tags = {
    Name = "DevOpsIGW"
  }
}

resource "aws_route_table" "devops_rt" {
  vpc_id = aws_vpc.devops_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.devops_igw.id
  }
  tags = {
    Name = "DevOpsRouteTable"
  }
}

resource "aws_route_table_association" "devops_rta" {
  subnet_id      = aws_subnet.devops_subnet.id
  route_table_id = aws_route_table.devops_rt.id
}

# ----------------------------
# Security Group
# ----------------------------
resource "aws_security_group" "devops_sg" {
  name        = "DevOpsSG"
  description = "Allow SSH, HTTP, Jenkins, Docker Swarm"
  vpc_id      = aws_vpc.devops_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 2377
    to_port     = 7946
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 7946
    to_port     = 7946
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 4789
    to_port     = 4789
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "DevOpsSG"
  }
}

# ----------------------------
# Key Pair (Placeholder)
# ----------------------------
resource "aws_key_pair" "devops_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

# ----------------------------
# EC2 Instances
# ----------------------------
resource "aws_instance" "controller" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.devops_subnet.id
  vpc_security_group_ids = [aws_security_group.devops_sg.id]
  key_name               = aws_key_pair.devops_key.key_name
  associate_public_ip_address = true
  tags = {
    Name = "Controller"
  }
}

resource "aws_instance" "manager" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.devops_subnet.id
  vpc_security_group_ids = [aws_security_group.devops_sg.id]
  key_name               = aws_key_pair.devops_key.key_name
  associate_public_ip_address = true
  tags = {
    Name = "Manager"
  }
}

resource "aws_instance" "worker_a" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.devops_subnet.id
  vpc_security_group_ids = [aws_security_group.devops_sg.id]
  key_name               = aws_key_pair.devops_key.key_name
  associate_public_ip_address = true
  tags = {
    Name = "WorkerA"
  }
}

resource "aws_instance" "worker_b" {
  ami                    = var.ami_id
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.devops_subnet.id
  vpc_security_group_ids = [aws_security_group.devops_sg.id]
  key_name               = aws_key_pair.devops_key.key_name
  associate_public_ip_address = true
  tags = {
    Name = "WorkerB"
  }
}
