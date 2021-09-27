resource "aws_subnet" "public_subnet_1" {
  tags = {
    Name = "public_subnet_1a"
  }
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-1a"
}

resource "aws_subnet" "public_subnet_2" {
  tags = {
    Name = "public_subnet_1c"
  }
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1c"
}
