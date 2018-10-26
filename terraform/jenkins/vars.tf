variable "s3bucket" {
  default = "mmnix"
}

variable "vpc_cidr_block" {
  default = "172.31.0.0/16"
}

variable "subnet_cidr_block" {
  default = "172.31.110.0/24"
}

variable "public_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC4bDHLCaxP7iwS75E8ORbMq3SKlPt7s2q/u6o6KcyfdDmYSyrDpR2Z56NFnsjLbJ4q4oUujzb+8Kr5FAQlWkR8qV8VaVnptV0g/nB3jDk1ZvPFdkZGA6mq6QLC/WFNbGPTxMB9LThtmJuDP/oZ8yDKEGg6XHRXF/GgrAjpK2XEmv9cBFpBXZ0YrTsOjMv9aHHHIa9Ayr+v3jrBAHS8YatSnOsk/B5OYoietGxtE1FsS4iXRRdO+6C2iyOW640RU2MzHvRnwXnvEN63nAOepxlHZLTOMahDk2h0Vhb9rfkD4R83HALh4KOpmjbjjlrugfaK+XcLbYsNFGGEDh1mXm/n omolchanov@WS00MU011"
}

variable "ami" {
  default = "ami-0773391ae604c49a4"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "region" {
  default = "eu-west-1"
}

variable "zone_id" {
  default = "Z5U24M0DL4VE4"
}

variable "dns_name" {
  default = "jenkins.mmnix.pp.ua"
}

