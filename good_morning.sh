#!/bin/sh

echo "Syncing recent changes. One moment, please..."

cd ~/Documents/GitHub/OneCPD/
git pull
yarn
source $WORKON_HOME/OneCPD/bin/activate
pip install --upgrade pip
poetry install

cd ~/Documents/GitHub/cpd-mobile/
git pull
yarn

yarn global add expo-cli
yarn global upgrade
brew upgrade

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm install --lts

echo "Sync complete. Have a great day!"
