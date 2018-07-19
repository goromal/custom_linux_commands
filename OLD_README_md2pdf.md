# md2pdf

A command-line tool for converting markdown files to pdf files.

## Installation

This installation assumes that you already have a version of LaTex (like texlive) installed on your machine.

Clone this repository into wherever you want it to be installed on your machine. Then, run the installation script:

```
sudo ./INSTALL.sh
```
Before using the command, ensure that your ~/.bashrc has been sourced.

## Usage
```
md2pdf [options] infile outfile

	options:
	-f | --mainfont (default="Palatino") Set main document font.
	-s | --sansfont (default="Helvetica") Set document sansfont.
	-m | --monofont (default="Menlo") Set document monofont.
	-x | --fontsize (default=12) Set document font size.
	-v | --version  (default=0.0) Set document displayed version.
```
