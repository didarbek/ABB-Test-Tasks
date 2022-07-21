resource "aws_security_group" "web" {
	name = "tf-web"

	ingress {
		from_port   = 5000
		to_port     = 5000
		protocol    = "TCP"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port   = 0
		to_port     = 65535
		protocol    = "TCP"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port 	= 0
		to_port 	= 65535
		protocol    = "UDP"
		cidr_blocks = ["0.0.0.0/0"]
	}

	description =  "Allows access to port 80 from Internet"

	tags = {
		Name = "web-sg"
	}
}

resource "aws_security_group" "ssh" {
	name = "tf-ssh"

	ingress {
		from_port 	= 22
		protocol 	= "TCP"
		to_port 	= 22
		cidr_blocks = ["<your_public_ip>/32"]
	}

	description = "Allows access to 22 port from Internet"

	tags = {
		Name = "ssh-sg"
	}
}