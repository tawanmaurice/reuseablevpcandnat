# Public RT -> IGW
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "ec2practice11225-rtb-public" }
}

resource "aws_route" "public_igw_default" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public1a" {
  subnet_id      = aws_subnet.public1a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public1b" {
  subnet_id      = aws_subnet.public1b.id
  route_table_id = aws_route_table.public.id
}

# Four private RTs -> single NAT
resource "aws_route_table" "private1a" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "ec2practice11225-rtb-private1-us-east-1a" }
}
resource "aws_route" "private1a_nat" {
  route_table_id         = aws_route_table.private1a.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_public1a.id
}
resource "aws_route_table_association" "assoc_private1a" {
  subnet_id      = aws_subnet.private1a.id
  route_table_id = aws_route_table.private1a.id
}

resource "aws_route_table" "private1b" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "ec2practice11225-rtb-private2-us-east-1b" }
}
resource "aws_route" "private1b_nat" {
  route_table_id         = aws_route_table.private1b.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_public1a.id
}
resource "aws_route_table_association" "assoc_private1b" {
  subnet_id      = aws_subnet.private1b.id
  route_table_id = aws_route_table.private1b.id
}

resource "aws_route_table" "private2a" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "ec2practice11225-rtb-private3-us-east-1a" }
}
resource "aws_route" "private2a_nat" {
  route_table_id         = aws_route_table.private2a.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_public1a.id
}
resource "aws_route_table_association" "assoc_private2a" {
  subnet_id      = aws_subnet.private2a.id
  route_table_id = aws_route_table.private2a.id
}

resource "aws_route_table" "private2b" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "ec2practice11225-rtb-private4-us-east-1b" }
}
resource "aws_route" "private2b_nat" {
  route_table_id         = aws_route_table.private2b.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_public1a.id
}
resource "aws_route_table_association" "assoc_private2b" {
  subnet_id      = aws_subnet.private2b.id
  route_table_id = aws_route_table.private2b.id
}
