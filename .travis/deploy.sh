#!/bin/bash
# Decrypt the private key
echo "---- 1 -----"
openssl aes-256-cbc -K $encrypted_adc0b7f2dba9_key -iv $encrypted_adc0b7f2dba9_key -in .travis/private_key.enc -out ~/.ssh/id_rsa -d
echo "---- 2 -----"
# Set the permission of the key
chmod 600 ~/.ssh/id_rsa
# Start SSH agent
eval $(ssh-agent)
# Add the private key to the system
ssh-add ~/.ssh/id_rsa
# Copy SSH config
cp .travis/ssh_config ~/.ssh/config
# Set Git config
git config --global user.name "henryhuang"
git config --global user.email h1886@outlook.com
# Clone the repository
git clone git@git.coding.net:henryhuang/huangyijie.git -b coding-pages .deploy_git
# Deploy to GitHub
npm run deploy