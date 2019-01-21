# Custom Linux Commands
Linux/ROS custom commands that are useful to me. All commands meant for and tested on Ubuntu 16.04.

# Installation

This command library assumes that you already have the following installed on your machine:

- a version of LaTex (like texlive)
- ROS Kinetic/Melodic (desktop version)

Clone this repository into wherever you want it to be installed on your machine. Then, run the installation script to make all custom commands usable:

```
sudo ./INSTALL.sh
```

Ensure that this directory is added to your PATH variable to use these commands.

# Custom Commands

## md2pdf

A command-line tool for converting markdown files to pdf files.

```
md2pdf [options] infile outfile

    Options:
    -t | --template (default=1) Set the output document template.
       |                        Options are:
       |                        (1) Bookmarks [x] Numbered Headings [x]
       |                        (2) Bookmarks [x] Numbered Headings [ ]
       |                        (3) Bookmarks [ ] Numbered Headings [x]
       |                        (4) Bookmarks [ ] Numbered Headings [ ]
    -f | --mainfont (default="Palatino") Set main document font.
    -s | --sansfont (default="Helvetica") Set document sansfont.
    -m | --monofont (default="Menlo") Set document monofont.
    -x | --fontsize (default=12) Set document font size. Options
       |                         are 8-12, 14, 17, 20.
    -v | --version  (default=0.0) Set document displayed version.
```

## code2pdf

A command-line tool for converting plain text code files to color-coded pdf files.

```
usage: code2pdf [options] infile outfile
```

## create_catkin_ws

Creates a catkin workspace with the useful sourceror.sh file.

```
usage: create_catkin_ws

Run this command IN the directory that you wish to be the top level of a new catkin workspace.
```

## echo_[color]

A selection of custom echo commands that will print with the specified color:

```
echo_black
echo_blue
echo_cyan
echo_green
echo_purple
echo_red
echo_white
echo_yellow
```

## ldgen

Converts simple markdown essays into a specially formatted pdf.

```
usage: ldgen filename

Convert markdown filename.md to a specially-formatted pdf essay.
```
