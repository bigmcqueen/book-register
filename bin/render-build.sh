#!/bin/bash
set -o errexit

bundle exec rails db:migrate

mkdir -p tmp/pids

exec "$@"