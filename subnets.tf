# Public
resource "aws_subnet" "public1a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.112.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags                    = { Name = "ec2practice11225-subnet-public1-us-east-1a" }
}

resource "aws_subnet" "public1b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.112.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags                    = { Name = "ec2practice11225-subnet-public2-us-east-1b" }
}

# Private (four, as per your build)
resource "aws_subnet" "private1a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.112.11.0/24"
  availability_zone = "us-east-1a"
  tags              = { Name = "ec2practice11225-subnet-private1-us-east-1a" }
}

resource "aws_subnet" "private1b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.112.12.0/24"
  availability_zone = "us-east-1b"
  tags              = { Name = "ec2practice11225-subnet-private2-us-east-1b" }
}

resource "aws_subnet" "private2a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.112.13.0/24"
  availability_zone = "us-east-1a"
  tags              = { Name = "ec2practice11225-subnet-private3-us-east-1a" }
}

resource "aws_subnet" "private2b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.112.14.0/24"
  availability_zone = "us-east-1b"
  tags              = { Name = "ec2practice11225-subnet-private4-us-east-1b" }
}
