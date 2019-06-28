#!/bin/sh

# Install Node.js:
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install some dependencies:
sudo apt-get install git libsecret-1-dev
sudo npm install -g jake
sudo npm install -g typings
sudo npm install -g pxt

# Clone repos from GitHub:
git clone https://github.com/Microsoft/pxt
git clone https://github.com/Microsoft/pxt-common-packages
git clone https://github.com/Microsoft/pxt-adafruit

cd pxt
npm install
typings install
jake

cd ..
cd pxt-common-packages
npm install
sudo npm link ../pxt

cd ..
cd pxt-adafruit
npm install
sudo npm link ../pxt
sudo npm link ../pxt-common-packages