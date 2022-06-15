variable "aws_region" {
	description = "AWS Region to launch servers"
	default     = "us-east-1"
}

variable "aws_access_key" {
	description = "AWS User Access Key"
	default     = "<Your AWS Access Key>" 
}

variable "aws_secret_key" {
	description = "AWS User Secret Key"
	default     = "<Your AWS Secret Key>" 
}

variable "aws_amis" {
	default = {
		us-east-1 = "ami-0f9cf087c1f27d9b1"
		eu-west-2 = "ami-095ed825090131933"
	}
}

variable "instance_type" {
	description = "Type of AWS EC2 instance."
	default     = "t2.micro"
}

variable "public_key_path" {
	description = "Enter the path to the SSH Public Key to add to AWS"
	default 	= "~/.ssh/yourkey.pem"
}

variable "key_name" {
	description = "AWS key name"
	default 	= "name of keypair"
}

variable "instance_count" {
	default = 1
}

