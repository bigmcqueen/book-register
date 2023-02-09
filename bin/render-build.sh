#!/bin/bash
set -o errexit

bundle exec rails db:migrate
mkdir -p /tmp/sockets
mkdir -p /tmp/pids

exec "$@"