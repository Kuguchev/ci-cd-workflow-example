#!/bin/sh

set -e

if [ ! -f ~/data/"${APP_SQLITE_DB_FILE}".db ]; then
  cp /usr/local/bin/"${APP_SQLITE_DB_FILE}".db ~/data/"${APP_SQLITE_DB_FILE}".db
fi

cd ~/data

exec "${APP_REPO} "$@"
