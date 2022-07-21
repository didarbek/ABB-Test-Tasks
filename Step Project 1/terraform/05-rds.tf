resource "aws_security_group" "rds-db-sg" {
	name = "postgres-security-group"
	vpc_id = aws_vpc.fp-vpc.id

	ingress {
		from_port = 5432
		to_port = 5432
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}

resource "aws_db_instance" "fp-rds" {
	allocated_storage 			= 20
	storage_type 				= "gp2"
	engine 						= "postgres"
	engine_version 				= "14"
	instance_class 				= "db.t2.micro"
	name 						= "abb_db"
	username 					= "abb_user"
	password 					= "abb_password"
	port 						= "5432"
	vpc_security_group_ids 		= [aws_security_group.rds-db-sg.id]
	parameter_group_name 		= "default.postgres14"
	publicly_accessible 		= false
	allow_major_version_upgrade = false
	auto_minor_version_upgrade  = false
	apply_immediately 			= true
	storage_encrypted 			= false
}