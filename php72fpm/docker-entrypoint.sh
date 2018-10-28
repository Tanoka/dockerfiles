#!/bin/sh
set -e

service php7.2-fpm start

exec "$@"
