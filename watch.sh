#!/bin/sh

set -e
current_pwd=$(pwd)

# Frontend compilation
cd ./ &&

printf "Checking & installing npm modules..." &&
npm install &&
printf "done.\n"

printf "Checking & installing bower components..." &&
bower install &&
printf "done.\n"

echo "Starting brunch compilation and auto-reload..."

brunch watch &
pid=$!

# If this process dies, kill all the children
trap "kill 0" EXIT

wait ${pid}