#!/bin/bash

usage()
{
cat << EOF
usage: pb [-h | --help] iternum itertot [barsize] [echocom]

Prints a progress bar.

Arguments:
  iternum: current iteration number
  itertot: number of total iterations
  barsize: (Default: 20) size of the progress bar in characters
  echocom: (Default: echo) special echo command for printing, such as echo_blue

Example Usage:
  N=0
  T=20
  while [ \$N -le \$T ]; do
    pb \$N \$T
    N=\$[\$N+1]
    sleep 1
  done
  echo

EOF
}

if [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
  usage
  exit
fi

ITERNUM=$1
ITERTOT=$2
BARSIZE=$3
ECHOCOM=$4

if [[ -z $ECHOCOM ]]; then
  ECHOCOM="echo"
fi

if [[ -z $BARSIZE ]]; then
  BARSIZE=20
fi

# PADCHAR='#' # if ${BASH_VERSION} < 4.2
PADCHAR='\u2588' # if ${BASH_VERSION} >= 4.2
# https://en.wikipedia.org/wiki/Box-drawing_character

echoCharWithLength() {
  CHAR=$1
  LENGTH=$2
  N=0
  while [ $N -lt $LENGTH ]; do
    ESTR="$ECHOCOM -en '${CHAR}'"
    eval "$ESTR"
    N=$[$N+1]
  done
}

PERCENTAGE=$((100 * $ITERNUM / $ITERTOT))
BARNUM=$(($BARSIZE * $ITERNUM / $ITERTOT))
SPCNUM=$(($BARSIZE - $BARNUM))

ESTR="$ECHOCOM -n '['"
eval "$ESTR"
echoCharWithLength $PADCHAR $BARNUM
echoCharWithLength ' ' $SPCNUM
ENDSTR1="] "
ESTR="$ECHOCOM -n '${ENDSTR1}'"
eval "$ESTR"
echo -ne "(${PERCENTAGE}%)\r"
