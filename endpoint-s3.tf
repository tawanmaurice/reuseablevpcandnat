# S3 Gateway Endpoint associated to the four private RTs
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = aws_vpc.main.id
  service_name      = "com.amazonaws.us-east-1.s3"
  vpc_endpoint_type = "Gateway"

  route_table_ids = [
    aws_route_table.private1a.id,
    aws_route_table.private1b.id,
    aws_route_table.private2a.id,
    aws_route_table.private2b.id,
  ]

  tags = { Name = "ec2practice11225-vpce-s3" }
}

