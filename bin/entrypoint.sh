#!/bin/bash
set -e

rm -f /book-register/tmp/pids/server.pid

bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate

exec "$@"