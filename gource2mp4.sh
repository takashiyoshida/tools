#!/bin/sh

#
# This script uses Gource to generate a PPM video stream from source control 
# log (Git, Mercurial, etc) and save the video stream to MPEG4 format.
#

GOURCE=/opt/local/bin/gource
GOURCE_OPT="--disable-progress --stop-at-end --output-ppm-stream -"

FFMPEG=/opt/local/bin/ffmpeg
FFMPEG_OPT="-y -b 3000K -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -vpre"

# See other available options in /opt/local/share/ffmpeg
FFMPEG_VPRE="libx264-default"

`${GOURCE} ${GOURCE_OPT} $1 | ${FFMPEG} ${FFMPEG_OPT} ${FFMPEG_VPRE} $2`
