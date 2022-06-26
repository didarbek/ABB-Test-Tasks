# Home Task 5 - AWSCLI

Goal: recall AWS EC2 instances and learn awscli tool.
Prerequisites:
awscli is installed;
aws profile is configured.
[optional] terraform/ansible is installed.
Tasks:

1. Install EC2 instance with any Linux distribution either with AWS console or Terraform. Note: you can use EC2 instance from HW4. 

2. Install following packages.

 - git;

 - nginx;

 - docker.

3. Install custom motd (login banner). See examples here https://www.putorius.net/custom-motd-login-screen-linux.html

Note: 2 and 3 steps should be done with either a user_data script or ansible playbook.

4. Create a bash/PowerShell script which will create AMI from your instance and will wait until the image would be available. instance_name should be a first argument, see the wait_ami_available() function example below. For image creating you can use this article as a reference https://datawookie.dev/blog/2021/07/creating-an-ami-using-the-aws-cli/.

```

#!/bin/bash

instance_name=$1



wait_ami_available() {

    local image_id=$1

    for i in {0..120}; do

        state=$(aws ec2 describe-images \

           --region eu-west-2 \

           --owners self \

           --output text \

           --filters "Name=image-id,Values=${image_id}" \

           --query 'sort_by(Images, &CreationDate)[].State')

        if [[ "${state}" = 'available' ]]; then

            echo "available"

            return

        fi

        sleep 30

    done

    echo "unavailable"

}

```

Artifact for the homework should be an archive containing:
bash/PowerShell script to create custom AMI;
bash script or ansible playbook to install packages and configure motd.