#!/usr/bin/env bash

yum update
yum install docker -y
usermod -aG docker ec2-user
systemctl enable docker
systemctl start docker

yum install git -y

cat << HEREDOC > /root/.ssh/id_rsa
<OPENSSH PRIVATE KEY>
HEREDOC

chmod 0400 /root/.ssh.id_rsa

mkdir -p /src/phonebook

cd /src/phonebook

ssh-keyscan github.com >> /root/.ssh/known_hosts
git clone git@github.com:didarbek/PhoneBook.git

cd PhoneBook

docker-compose up --build