#!/bin/sh
set -e

service php5.6-fpm start

exec "$@"
