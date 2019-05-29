#!/bin/bash

# install pandoc if not already installed (for md2pdf)
sudo apt-get install -y pandoc

# install ghostscript if not already installed (for code2pdf)
sudo apt-get install -y ghostscript

# add this executable to path
# TODO: FIND A BETTER WAY TO DO THIS
# INSTALL_DIR="${PWD}"
# echo 'export PATH="$PATH:'$INSTALL_DIR'"' >> ~/.bashrc

cp -r res/texmf/ ~/texmf/
