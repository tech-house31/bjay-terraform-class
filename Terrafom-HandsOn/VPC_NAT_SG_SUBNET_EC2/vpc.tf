#Create AWS VPC
resource "aws_vpc" "TechHouse" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "TechHouse-vpc"
  }
}

# Public Subnets in Custom VPC
resource "aws_subnet" "TechHousePub-Sub1" {
  vpc_id                  = aws_vpc.TechHouse.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "TechHousePub-Sub1"
  }
}

resource "aws_subnet" "TechHousePub-Sub2" {
  vpc_id                  = aws_vpc.TechHouse.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "TechHousePub-Sub2"
  }
}

resource "aws_subnet" "TechHousePub-Sub3" {
  vpc_id                  = aws_vpc.TechHouse.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "TechHousePub-Sub3"
  }
}

# Private Subnets in Custom VPC
resource "aws_subnet" "TechHousePri-Sub1" {
  vpc_id                  = aws_vpc.TechHouse.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "TechHousePri-Sub1"
  }
}

resource "aws_subnet" "TechHousePri-Sub2" {
  vpc_id                  = aws_vpc.TechHouse.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "TechHousePri-Sub2"
  }
}

resource "aws_subnet" "TechHousePri-Sub3" {
  vpc_id                  = aws_vpc.TechHouse.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "TechHousePri-Sub3"
  }
}

# Custom internet Gateway
resource "aws_internet_gateway" "TechHouse-gw" {
  vpc_id = aws_vpc.TechHouse.id

  tags = {
    Name = "TechHouse-gw"
  }
}

#Routing Table for the Custom VPC
resource "aws_route_table" "TechHouse-Pub-Rt" {
  vpc_id = aws_vpc.TechHouse.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.TechHouse-gw.id
  }

  tags = {
    Name = "TechHouse-Pub-Rt"
  }
}

resource "aws_route_table_association" "TechHouse-Rt-Ass1a" {
  subnet_id      = aws_subnet.TechHousePub-Sub1.id
  route_table_id = aws_route_table.TechHouse-Pub-Rt.id
}

resource "aws_route_table_association" "levelup-public-2-a" {
  subnet_id      = aws_subnet.TechHousePub-Sub2.id
  route_table_id = aws_route_table.TechHouse-Pub-Rt.id
}

resource "aws_route_table_association" "levelup-public-3-a" {
  subnet_id      = aws_subnet.TechHousePub-Sub3.id
  route_table_id = aws_route_table.TechHouse-Pub-Rt.id
}