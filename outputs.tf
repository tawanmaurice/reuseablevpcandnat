output "vpc_id" { value = aws_vpc.main.id }

output "public_subnet_ids" {
  value = [aws_subnet.public1a.id, aws_subnet.public1b.id]
}

output "private_subnet_ids" {
  value = [
    aws_subnet.private1a.id,
    aws_subnet.private1b.id,
    aws_subnet.private2a.id,
    aws_subnet.private2b.id
  ]
}

output "nat_gateway_id" { value = aws_nat_gateway.nat_public1a.id }
output "s3_endpoint_id" { value = aws_vpc_endpoint.s3.id }

