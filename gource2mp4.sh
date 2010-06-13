#!/bin/sh

#
# This script uses Gource to generate a PPM video stream from source control 
# log (Git, Mercurial, etc) and save the video stream to MPEG4 format.
#
# This script is intended to take output from TFSConverter by mikeashley.
# TFSConverter | <http://github.com/mikeashley/TFSConverter>
#
# I actually have not tested the script with Git or Mercurial based 
# projects.
#

GOURCE=/opt/local/bin/gource
GOURCE_OPT="--hide filenames --highlight-all-users --camera-mode track --disable-progress --stop-at-end --output-ppm-stream -"

FFMPEG=/opt/local/bin/ffmpeg
FFMPEG_OPT="-y -b 3000K -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -vpre"

# See other available options in /opt/local/share/ffmpeg
# Also see Robert Swan's weblog about FFMPEG and x264 encoding:
# <http://rob.opendot.cl/index.php/useful-stuff/ffmpeg-x264-encoding-guide/>
FFMPEG_VPRE="libx264-default"

if [ $# != 2 ]; then
	echo "usage: $0 <input file> <output file>"
	exit 0
fi

${GOURCE} ${GOURCE_OPT} "$1" | ${FFMPEG} ${FFMPEG_OPT} ${FFMPEG_VPRE} "$2"
