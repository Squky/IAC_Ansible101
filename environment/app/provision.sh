#!/bin/bash

# Update the sources list
sudo apt-get update -y

# upgrade any packages available
sudo apt-get upgrade -y

# install nginx
sudo apt-get install nginx -y

# install git
sudo apt-get install git -y

# install nodejs
sudo apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

# install pm2
sudo npm install pm2 -g

# npm install and start
#echo 'export DB_HOST=mongodb://192.168.10.200:27017/posts' >> ~/.bashrc
sudo npm install


sudo rm ../../etc/nginx/sites-available/default
#sudo rm ../../etc/nginx/sites-available/reverse-proxy.conf

sudo cp /home/ubuntu/reverse-prox/reverse-proxy.conf /etc/nginx/sites-available/

sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
sudo systemctl restart nginx

cd ~/../ubuntu/app
pm2 start app.js