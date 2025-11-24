# VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.project_name}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

# Public Subnet 1 (AZ-A)
resource "aws_subnet" "public-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/26"
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-subnet-public-a"
  }
}

# Public Subnet 2 (AZ-C)
resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.11.0/26"
  availability_zone       = "${var.aws_region}c"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-subnet-public-c"
  }
}

# Private Subnet 1 (AZ-A)
resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/26"
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "${var.project_name}-subnet-private-a"
  }
}

# Private Subnet 2 (AZ-C)
resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.12.0/26"
  availability_zone = "${var.aws_region}c"

  tags = {
    Name = "${var.project_name}-subnet-private-c"
  }
}


# RDS Subnet 1 (AZ-A)
resource "aws_subnet" "rds_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/26"
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "${var.project_name}-subnet-rds-a"
  }
}

# RDS Subnet 2 (AZ-C)
resource "aws_subnet" "rds_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.13.0/26"
  availability_zone = "${var.aws_region}c"

  tags = {
    Name = "${var.project_name}-subnet-rds-c"
  }
}


# Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-nat-eip"
  }

  depends_on = [aws_internet_gateway.main]
}

# NAT Gateway (AZ-A Public Subnet)
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "${var.project_name}-nat-gateway"
  }

  depends_on = [aws_internet_gateway.main]
}
