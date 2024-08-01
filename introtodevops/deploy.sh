#!/bin/bash
sudo /home/ubuntu/.nvm/versions/node/v20.5.1/bin/npm ci
sudo /home/ubuntu/.nvm/versions/node/v20.5.1/bin/npm run build
pm2 start npm --name "introtodevops" -- start 
pm2 restart introtodevops
sudo systemctl restart nginx