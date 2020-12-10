#!/bin/bash

set -euxo pipefail

apt install -y software-properties-common
add-apt-repository -y ppa:deadsnakes/ppa
apt install -y python3.7 python3.7-dev
update-alternatives --install /usr/bin/python python /usr/bin/python3.7 10
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
rm get-pip.py

# install pytorch
pip install torch==1.7.0+cu92 torchvision==0.8.1+cu92 -f https://download.pytorch.org/whl/torch_stable.html
pip install numpy imageio glob2 pybind11 click matplotlib joblib Pillow plotly gtimer moviepy gym Shapely==1.6.4.post2 opencv-python==4.1.1.26 pyquaternion==0.9.5 sk-video==1.1.10