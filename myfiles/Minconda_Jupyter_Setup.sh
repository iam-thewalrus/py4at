#!/bin/bash
#
# Script to Install
# Linux System Tools and Basic Python Components
# as well as to
# Start Jupyter Lab Server
#
# Python for Algorithmic Trading
# (c) Dr. Yves J. Hilpisch
# The Python Quants GmbH
#
# GENERAL LINUX
apt update  # updates the package index cache
apt upgrade -y  # updates packages
# install system tools
apt install -y build-essential git  # system tools
apt install -y screen htop vim wget  # system tools
apt upgrade -y bash  # upgrades bash if necessary
apt clean  # cleans up the package index cache

# INSTALLING MINICONDA
cd /tmp
curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh --output Miniconda.sh
bash Miniconda.sh -b  # installs Miniconda
rm -rf Miniconda.sh  # removes the installer
# activate
source ~/.bashrc

#CREATE ENV
read -p "Enter environment name: " envname
conda create --name $envname python=3.11

# INSTALLING PYTHON LIBRARIES
conda install --name $envname jupyter jupyterlab numpy pytables pandas scipy matplotlib seaborn quandl scikit-learn openpyxl xlrd xlwt pyyaml plotly tensorflow keras

#jupyter  # interactive data analytics in the browser
#jupyterlab  # Jupyter Lab environment
#numpy  #  numerical computing package
#pytables  # wrapper for HDF5 binary storage
#pandas  #  data analysis package
#scipy  #  scientific computations package
#matplotlib  # standard plotting library
#seaborn  # statistical plotting library
#quandl  # wrapper for Quandl data API
#scikit-learn  # machine learning library
#openpyxl  # package for Excel interaction
#xlrd xlwt  # packages for Excel interaction
#pyyaml  # package to manage yaml files
#plotly  # interactive D3.js plots
#tensorflow  # deep learning library
#keras  # deep learning library

pip install --upgrade pip  # upgrading the package manager
pip install q  # logging and debugging
pip install cufflinks  # combining plotly with pandas
pip install eikon  # Python wrapper for the Refinitiv Eikon Data API
pip install git+git://github.com/yhilpisch/tpqoa # Python wrapper for Oanda API

# COPYING FILES AND CREATING DIRECTORIES
mkdir -p ~/.jupyter/custom
wget http://hilpisch.com/custom.css
mv custom.css ~/.jupyter/custom
mv ~/jupyter_notebook_config.py ~/.jupyter/
#mv ~/mycert.pem /root/.jupyter # setup ssl
#mv ~/mykey.key /root/.jupyter # setup ssl
mkdir ~/notebook
cd ~/notebook

# STARTING JUPYTER LAB
jupyter lab &