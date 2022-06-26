provider "aws" {
	profile = "default"
	region  = "us-east-1"
}


resource "random_string" "flask-secret-key" {
	length  = 16
	special = true
	override_special = "/@\" "
}


resource "aws_ecs_cluster" "fp-ecs-cluster" {
	name = "step-project"

	tags = {
		Name = "step-project"
	}
}


resource "aws_ecs_task_definition" "fp-ecs-task" {
	family = "step-project"
	requires_compatabilities = ["FARGATE"]
	network_mode = "awsvpc"
	cpu = 512
	memory = 2048
	container_definitions = <<DEFINITION
	[
   {
      "name":"flask-app",
      "image":"${var.flask_app_image}",
      "essential":true,
      "portMappings":[
         {
            "containerPort":8080,
            "hostPort":8080,
            "protocol":"tcp"
         }
      ],
      "environment":[
         {
            "name":"POSTGRES_USER",
            "value":"${aws_db_instance.fp-rds.username}"
         },
         {
            "name":"POSTGRES_PASSWORD",
            "value":"${aws_db_instance.fp-rds.password}"
         },
         {
            "name":"POSTGRES_ENDPOINT",
            "value":"${aws_db_instance.fp-rds.endpoint}"
         },
         {
            "name":"POSTGRES_DATABASE",
            "value":"${aws_db_instance.fp-rds.name}"
         },
         {
            "name":"FLASK_APP",
            "value":"${var.flask_app}"
         },
         {
            "name":"FLASK_ENV",
            "value":"${var.flask_env}"
         },
         {
            "name":"APP_HOME",
            "value":"${var.app_home}"
         },
         {
            "name":"APP_PORT",
            "value":"${var.flask_app_port}"
         },
         {
            "name":"APP_SECRET_KEY",
            "value":"${random_string.flask-secret-key.result}"
         }
      ]
   }
]
DEFINITION
}


