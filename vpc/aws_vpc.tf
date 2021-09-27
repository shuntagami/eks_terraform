resource "aws_vpc" "vpc" {
  tags = {
    Name = "test_vpc"
  }
  cidr_block           = "10.0.0.0/21"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
}
