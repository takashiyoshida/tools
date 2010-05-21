#!/bin/sh

DROPBOX="${HOME}/Dropbox"
PHOTOS="${DROPBOX}/Photos"

# Create a filename that we will use for a new screen capture.
filename=`date "+%Y%m%d%H%M%S"`
/usr/sbin/screencapture -t png "${PHOTOS}/${filename}.png"


