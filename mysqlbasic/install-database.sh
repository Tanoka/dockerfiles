#! /bin/bash

set -e

echo "SOURCE sakila-db/sakila-schema.sql;" | mysql -u root
echo "SOURCE sakila-db/sakila-data.sql;" | mysql -u root

