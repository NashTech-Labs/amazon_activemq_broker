resource "aws_vpc" "vpc" {
  cidr_block = "10.22.51.0/24"
  tags = {
    Name = "amazon_mq_vpc"
  }
}

resource "aws_subnet" "public_subnets_b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.22.51.0/28"
  availability_zone = "ca-central-1b"
  tags = {
    name = "amazon_mq_public_subnet_b"
  }
}

resource "aws_subnet" "public_subnets_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.22.51.16/28"
  availability_zone = "ca-central-1a"
  tags = {
    name = "amazon_mq_public_subnet_a"
  }
}

resource "aws_subnet" "private_subnets_b" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.22.51.32/28"
  availability_zone = "ca-central-1b"
  tags = {
    name = "amazon_mq_private_subnet_b"
  }
}

resource "aws_subnet" "private_subnets_a" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.22.51.48/28"
  availability_zone = "ca-central-1a"
  tags = {
    name = "amazon_mq_private_subnet_1"
  }
}
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

}

resource "aws_route_table_association" "public_rt_association_q" {
  subnet_id      = aws_subnet.public_subnets_a.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "public_rt_association_b" {
  subnet_id      = aws_subnet.public_subnets_b.id
  route_table_id = aws_route_table.public_rt.id
}

