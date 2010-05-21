#!/bin/sh

SITE_DIR="${HOME}/Desktop"
DUMMY_APP="dummy_app"

RAILS=/opt/local/bin/rails
RAKE=/opt/local/bin/rake

${RAILS} ${SITE_DIR}/${DUMMY_APP}

cd "${SITE_DIR}/${DUMMY_APP}"
${RAKE} rails:freeze:gems
${RAKE} doc:rails
