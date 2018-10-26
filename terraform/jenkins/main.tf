provider "aws" {
  region = "${var.region}"
}

terraform {
  backend "s3" {}
}

resource "aws_vpc" "default" {
  cidr_block           = "${var.vpc_cidr_block}"
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.default.id}"
}

resource "aws_subnet" "tf_test_subnet" {
  vpc_id                  = "${aws_vpc.default.id}"
  cidr_block              = "${var.subnet_cidr_block}"
  map_public_ip_on_launch = true
  depends_on              = ["aws_internet_gateway.gw"]
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "${var.public_key}"
}

resource "aws_instance" "jenkins" {
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  key_name               = "deployer-key"
  subnet_id              = "${aws_subnet.tf_test_subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]
}

resource "aws_eip" "bar" {
  vpc = true
  instance                  = "${aws_instance.jenkins.id}"
  associate_with_private_ip = "${aws_instance.jenkins.private_ip}"
  depends_on                = ["aws_internet_gateway.gw"]
}
