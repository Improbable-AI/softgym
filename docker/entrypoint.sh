#!/bin/bash
set -e

# setup ros environment
echo "export PYFLEXROOT=${PWD}/PyFlex" >> ~/.bashrc
echo "export PYTHONPATH=${PYFLEXROOT}/bindings/build" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=${PYFLEXROOT}/external/SDL2-2.0.4/lib/x64:${LD_LIBRARY_PATH}" >> ~/.bashrc

eval "bash"

exec "$@"
