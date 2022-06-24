#!/bin/bash


# using create-image to create out image
create_image = aws ec2 create-image \
    --instance-id i-1234567890abcdef0 \
    --name "My server" \
    --description "An AMI for my server"

# getting "image_id" from json output
image_id = $(create_image | jq '.ImageId')

# using wait image-available to wait till image will be available
aws ec2 wait image-available --image-ids ${image_id} --filter "Name=state,Values=available"
