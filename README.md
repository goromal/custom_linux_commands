# Custom Linux Commands
Linux/ROS custom commands that are useful to me. All commands meant for and tested on Ubuntu 16.04.

# Installation

This command library assumes that you already have the following installed on your machine:

- a version of LaTex (like texlive)
- ROS Kinetic (desktop version)

Clone this repository into wherever you want it to be installed on your machine. Then, run the installation script to make all custom commands usable:

```
sudo ./INSTALL.sh
```

_**TODO**_: add note about adding to path (unless it does it automatically)

# Custom Commands

## md2pdf

A command-line tool for converting markdown files to pdf files.

```
md2pdf [options] infile outfile

    options:
    -f | --mainfont (default="Palatino") Set main document font.
    -s | --sansfont (default="Helvetica") Set document sansfont.
    -m | --monofont (default="Menlo") Set document monofont.
    -x | --fontsize (default=12) Set document font size. Options
       |                         are 8-12, 14, 17, 20.
    -v | --version  (default=0.0) Set document displayed version.	
```
