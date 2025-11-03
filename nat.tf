# EIP for the NAT in public1a
resource "aws_eip" "nat" {
  domain = "vpc"
  tags   = { Name = "ec2practice11225-eip-us-east-1a" }
}

resource "aws_nat_gateway" "nat_public1a" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public1a.id
  tags          = { Name = "ec2practice11225-nat-public1-us-east-1a" }
  depends_on    = [aws_internet_gateway.igw]
}
