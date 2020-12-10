#!/bin/bash

set -euxo pipefail

git clone https://github.com/Improbable-AI/softgym.git
cd softgym
export PYFLEXROOT=${PWD}/PyFlex
export PYTHONPATH=${PYFLEXROOT}/bindings/build
export LD_LIBRARY_PATH=${PYFLEXROOT}/external/SDL2-2.0.4/lib/x64:${LD_LIBRARY_PATH}
cd PyFlex/bindings
rm -rf build
mkdir build
cd build
cmake -DPYBIND11_PYTHON_VERSION=3.7 -Dpybind11_DIR=/usr/local/lib/python3.7/dist-packages/pybind11/share/cmake/pybind11 ..
make -j
cd ../../../
pip install -e .
mkdir data
