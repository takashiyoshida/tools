#!/bin/sh

#
# This script uses a built-in command, screencapture, in Mac OS X to
# take a screenshot and saves the captured screenshot to user's Dropbox
# folder.
#
# This script assumes that user already has Dropbox installed on 
# his/her machine (this creates a convenient access to Dropbox from
# user's home directory).
#
# While the script assumes the Dropbox is installed, it is possible
# to use another local directory. If you choose to use another 
# local directory, configure DROPBOX and PHOTOS variable to 
# point to your desired local directory.
#

DROPBOX="${HOME}/Dropbox"
PHOTOS="${DROPBOX}/Photos"

# Supported file format:
# png (default)
# pdf
# jpg
# tiff
IMG_FORMAT="png"

# Create a filename that we will use for a new screen capture.
# Filename is YYYYmmddHHMMSS

# I might want to look into a possibility that such filename already exists 
# at the destination. Maybe write with a temporary filename first, and 
# rename it when the new name is known to be available.
filename=`date "+%Y%m%d%H%M%S"`
/usr/sbin/screencapture -t ${IMG_FORMAT} "${PHOTOS}/${filename}.${IMG_FORMAT}"
