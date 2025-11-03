resource "aws_vpc" "main" {
  cidr_block           = "10.112.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = { Name = "ec2practice11225-vpc" }
}
