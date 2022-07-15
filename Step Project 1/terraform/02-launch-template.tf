resource "aws_launch_template" "back_end" {
	name = "lt-my-app"

	instance_type = "t2.micro"

	image_id = "ami-01cc34ab2709337aa"

	instance_initiated_shutdown_behavior = "terminate"

	update_default_version = true

	key_name = "<your_key>"

	network_interfaces {
		associate_public_ip_address = true

		security_groups = [
			aws_security_group.web.id,
      		aws_security_group.ssh.id
		]
	}

	placement {
		availability_zone = "us-east-1a"
	}

	tag_specifications {
		resource_type = "instance"

		tags = {
			Name = "back-end"
		}
	}

	user_data = filebase64("files/back_end_user_data.sh")
}