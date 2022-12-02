#!/bin/sh

echo "Syncing recent changes. One moment, please..."

cd ~/code/OneCPD/
git pull
yarn

# Get correct python version
. ~/code/OneCPD/setup/ec2.config

# Check if using the correct python version
if ! pyenv version | grep -q $PYTHON_VERSION; then
    # Install it if it is not installed
    if ! pyenv versions | grep -q $PYTHON_VERSION; then
        pyenv install $PYTHON_VERSION
    fi
    pyenv local $PYTHON_VERSION
    pip install pre-commit
fi

source $WORKON_HOME/OneCPD/bin/activate
pip install --upgrade pip
poetry self update
poetry install

cd ~/code/cpd-mobile/
git pull
yarn

yarn global add expo-cli
yarn global upgrade
brew upgrade

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm install --lts

echo "Sync complete. Have a great day!"
