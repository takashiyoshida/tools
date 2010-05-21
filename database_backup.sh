#!/bin/sh

#
# file: database_backup.sh
# version: 0.1
# date: December 20, 2009
#
# Takashi Yoshida | takashi@takashiyoshida.org
# <http://takashiyoshida.org>
#

MYSQLDUMP="/usr/bin/mysqldump"
GZIP="/bin/gzip"
FIND="/usr/bin/find"

DB_USER=""
DB_PASS=""

DATABASE=""

BACKUP_DIR=""

${MYSQLDUMP} --opt --skip-add-locks --user=${DB_USER} --password=${DB_PASS} ${DATABASE} | ${GZIP} > ${BACKUP_DIR}/${DATABASE}_`data "+%Y-%m-%d"`.gz
cd ${BACKUP_DIR}
${FIND} *.gz -mtime +7 -delete
