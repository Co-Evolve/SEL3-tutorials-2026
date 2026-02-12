#!/bin/bash

# We create virtual environments on the $VSC_DATA storage, as JAX takes quite some space.
mkdir $VSC_DATA/venvs
# To find it easier, we create a symbolic link
ln -s $VSC_DATA/venvs $VSC_HOME/venvs

# Load the necessary modules (always load these when you work on this project)
ml load GCCcore/13.3.0
ml load Python/3.12.3-GCCcore-13.3.0
ml load FFmpeg/7.0.2-GCCcore-13.3.0

# Create the virtual environment (cluster dependent)
cd venvs
python -m venv sel3_${VSC_INSTITUTE_CLUSTER}
cd ..

# Activate the virtual environment
source venvs/sel3_${VSC_INSTITUTE_CLUSTER}/bin/activate
pip install --upgrade pip

# Install packages
curl https://raw.githubusercontent.com/Co-Evolve/SEL3-tutorials-2026/refs/heads/main/requirements.txt > requirements.txt
pip install -r requirements.txt

# Enable our environment as a Jupyter Notebook kernel for the tutorials
python -m ipykernel install --user --name=sel3_${VSC_INSTITUTE_CLUSTER}-kernel
