data "aws_vpc" "default" {
  default = true
} 

data "aws_subnet" "default_az1" {
  availability_zone = "${var.region}a"
  vpc_id = data.aws_vpc.default.id
}

data "aws_subnet" "default_az2" {
  availability_zone = "${var.region}"
  vpc_id = data.aws_vpc.default.id
}

data "aws_subnet" "default_az3" {
  availability_zone = "${var.region}c"
  vpc_id = data.aws_vpc.default.id
}