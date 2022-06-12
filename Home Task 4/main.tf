terraform {
	required_providers {
	aws = {
	version = ""
	source = "hashicorp/aws"
		}
	}
}

provider "aws" {
	profile = "default"
	region = "us-east-1"
}

resource "aws_vpc" "nginx-vpc" {
	cidr_block = "10.0.0.0/16"
	enable_dns_support = "true"
	enable_dns_hostnames = "true"
	enable_classiclink = "false"
	instance_tenancy = "default"
}

resource "aws_subnet" "prod-subnet-public-1" {
	vpc_id = aws_vpc.nginx-vpc.id
	cidr_block = "10.0.1.0/24"
	map_public_ip_on_launch = "true"
	availability_zone = "us-east-1"
}

resource "aws_internet_gateway" "prod-igw" {
	vpc_id = aws_vpc.nginx-vpc.id
}

resource "aws_route_table" "prod-public-crt" {
	vpc_id = aws_vpc.nginx-vpc.id
	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.prod-igw.id
	}

tags = {
	Name = "prod-public-crt"
	}
}

resource "aws_route_table_association" "prod-crta-public-subnet-1" {
	subnet_id = aws_subnet.prod-subnet-public-1.id
	route_table_id = aws_route_table.prod-public-crt.id
}

resource "aws_security_group" "ssh-allowed" {
	vpc_id = aws_vpc.nginx-vpc.id

	egress {
		from_port = 0
		to_port = 0
		protocol = -1
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
}
