#!/bin/bash

# set permission
sudo chown -R ubuntu:ubuntu /var/www/core

# set paths
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

# go to folder
cd /var/www/blog/packages/blog

# copy env
# cp ../config/.env.local.core .env.local

# build application
npm run build

# install pm2
npm install pm2 -g

# start pm2
pm2 start server.config.js