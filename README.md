# Custom Linux Commands
Linux/ROS custom commands that are useful to me.

# Installation

This command library assumes that you already have the following installed on your machine:

- a version of LaTex (like texlive)

Clone this repository into wherever you want it to be installed on your machine. Then, run the installation script:

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
	-x | --fontsize (default=12) Set document font size.
	-v | --version  (default=0.0) Set document displayed version.
```
