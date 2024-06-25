resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "LB-main-vpc"
  }
}

resource "aws_subnet" "subnet" {
  count             = length(var.subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "LB-subnet${count.index + 1}"
  }
}
