#!/usr/bin/env bash

set -e

if [ ! -n "$TRAVIS" ]; then
   ./vendor/tedivm/dovecottesting/SetupEnvironment.sh
   sleep 5
fi

echo 'Running unit tests.'
./vendor/bin/phpunit --verbose --coverage-clover build/logs/clover.xml

echo ''
echo ''
echo ''
echo 'Testing for Coding Styling Compliance.'
echo 'All code should follow PSR standards.'
./vendor/bin/php-cs-fixer fix ./ --level="all" -vv --dry-run
