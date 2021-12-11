#!/bin/bash

# set permission to write
sudo chown -R ubuntu:ubuntu /var/www/blog

#export node home dir location
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

# go to folder
cd /var/www/blog/packages/blog

# install
npm install