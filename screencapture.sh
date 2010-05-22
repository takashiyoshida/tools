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

# Create a filename that we will use for a new screen capture.
filename=`date "+%Y%m%d%H%M%S"`
/usr/sbin/screencapture -t png "${PHOTOS}/${filename}.png"
