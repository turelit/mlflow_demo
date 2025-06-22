data "aws_vpc" "default" {
  default = true
} 

data "aws_subnet" "default_az1" {
  availability_zone = "az1"
  vpc_id = data.aws_vpc.default.id
}

data "aws_subnet" "default_az2" {
  availability_zone = "az2"
  vpc_id = data.aws_vpc.default.id
}

data "aws_subnet" "default_az3" {
  availability_zone = "az3"
  vpc_id = data.aws_vpc.default.id
}