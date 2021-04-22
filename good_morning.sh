#!/bin/sh

echo "Syncing recent changes. One moment, please..."
cd ~/Documents/GitHub/OneCPD/
git pull
yarn
source $WORKON_HOME/OneCPD/bin/activate
poetry install

cd ~/Documents/GitHub/cpd-mobile/
git pull
yarn

yarn global upgrade
yarn global add expo-cli
brew upgrade
nvm install --lts
echo "Sync complete. Have a great day!"
