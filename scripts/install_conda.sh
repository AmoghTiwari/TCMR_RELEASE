#!/usr/bin/env bash

# sudo apt install python3.9-venv
echo "Creating virtual environment"
# python3.9 -m venv tcmr-env
conda create -n tcmr_env python=3.9

echo "Activating virtual environment"
# source $PWD/tcmr-env/bin/activate
conda activate tcmr_env

# $PWD/tcmr-env/bin/pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113
python3 -m pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/cu113
# $PWD/tcmr-env/bin/pip install git+https://github.com/giacaglia/pytube.git --upgrade
python3 -m pip install git+https://github.com/giacaglia/pytube.git --upgrade
# $PWD/tcmr-env/bin/pip install -r requirements.txt
python3 -m pip install -r requirements.txt

