#!/bin/sh

echo "Syncing recent changes. One moment, please..."

cd ~/Documents/GitHub/OneCPD/
git pull
yarn

# Get correct python version
. ~/Documents/GitHub/OneCPD/setup/ec2.config

# Check if correct python version is already installed
if ! pyenv version | grep -q $PYTHON_VERSION; then
    # Install it if it is not
    pyenv install $PYTHON_VERSION
    pyenv global $PYTHON_VERSION
    pip install pre-commit
fi

source $WORKON_HOME/OneCPD/bin/activate
pip install --upgrade pip
poetry self update
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
