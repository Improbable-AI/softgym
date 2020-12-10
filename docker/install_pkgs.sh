#!/bin/bash

set -euxo pipefail

# install sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | tee /etc/apt/sources.list.d/sublime-text.list
apt-get update
apt-get install -y sublime-text

wget https://az764295.vo.msecnd.net/stable/e5a624b788d92b8d34d1392e4c4d9789406efe8f/code_1.51.1-1605051630_amd64.deb
apt install -y ./code_1.51.1-1605051630_amd64.deb
apt-get install -y libx11-xcb1 libxss1 libasound2 libxkbfile1
rm code_1.51.1-1605051630_amd64.deb