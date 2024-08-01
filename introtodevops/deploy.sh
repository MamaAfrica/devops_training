#!/bin/bash
# sudo /home/ubuntu/.nvm/versions/node/v20.5.1/bin/npm ci
sudo /home/ubuntu/.nvm/versions/node/v20.5.1/bin/npm run build
/home/ubuntu/.nvm/versions/node/v20.5.1/bin/pm2 start npm --name "introtodevops" -- start 
/home/ubuntu/.nvm/versions/node/v20.5.1/bin/pm2 restart introtodevops
sudo systemctl restart nginx