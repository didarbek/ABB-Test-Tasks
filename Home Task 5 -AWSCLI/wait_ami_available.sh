#!/bin/bash

instance_name=$1

wait_ami_available() {

    local image_id=$1

    for i in {0..120}; do

        state=$(aws ec2 describe-images \
        --region us-east-1 \
        --owners "<ACCOUNT_ID>" --filters "Name=name,Values=${ami_name}*" \
        --query 'reverse(sort_by(Images, &CreationDate))[*].Name' --output table)

        state=$(aws ec2 describe-images \

           --region us-east-1 \

           --owners self \

           --output text \

           --filters "Name=image-id,Values=${image_id}" \

           --query 'sort_by(Images, &CreationDate)[].State')

        if [[ "${state}" = 'available' ]]; then

            echo "available"

        fi


        sleep 30

    done

    #using wait image-available module to wait till image will be available
    aws ec2 wait image-available --image-ids ${image-id} --filter "Name=state,Values=available"

    echo "unavailable"

}

