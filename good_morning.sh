#!/bin/sh

echo "Syncing recent changes. One moment, please..."

cd ~/code/OneCPD/
git pull
yarn

# Make sure we have the latest pyenv
brew upgrade

# Get correct python version
. ~/code/OneCPD/setup/ec2.config

# Check if using the correct python version
NEW_PYTHON=false
if ! pyenv version | grep -q "${PYTHON_VERSION}"; then
    NEW_PYTHON=true
    # Install it if it is not installed
    if ! pyenv versions | grep -q "${PYTHON_VERSION}"; then
        pyenv install "${PYTHON_VERSION}"
    fi
    pyenv local "${PYTHON_VERSION}"
    pip install pre-commit
fi

if [ "$(command -v deactivate)" = 'deactivate' ]; then
    deactivate
fi
pip install --upgrade pip
pip install --upgrade virtualenvwrapper
if [ "${NEW_PYTHON}" = true ]; then
    PYENV_ROOT="${HOME}"'/.pyenv'
    source "${PYENV_ROOT}"'/versions/'"${PYTHON_VERSION}"'/bin/virtualenvwrapper.sh'
    rmvirtualenv OneCPD
    mkvirtualenv -p "${PYTHON_VERSION}" OneCPD
fi
if [ "$(command -v deactivate)" != 'deactivate' ]; then
    source "${WORKON_HOME}"'/OneCPD/bin/activate'
fi

poetry self update
poetry install

cd ~/code/cpd-mobile/
git pull
yarn

yarn global upgrade

export NVM_DIR=~/.nvm
[ -s "${NVM_DIR}"'/nvm.sh' ] && \. "${NVM_DIR}"'/nvm.sh'
nvm install --lts

echo "Sync complete. Have a great day!"
