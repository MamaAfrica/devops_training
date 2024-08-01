#!/bin/bash
# sudo /home/ubuntu/.nvm/versions/node/v20.5.1/bin/npm ci

# Define the path to npm and pm2
NPM_PATH="/home/ubuntu/.nvm/versions/node/v20.5.1/bin/npm"
PM2_PATH="/home/ubuntu/.nvm/versions/node/v20.5.1/bin/pm2"

# Run build
sudo $NPM_PATH run build

# Start or restart the application with PM2
$PM2_PATH start $NPM_PATH --name "introtodevops" -- start

# Restart nginx
sudo systemctl restart nginx
