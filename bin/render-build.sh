#!/bin/bash
set -o errexit

bundle exec rails db:migrate

exec "$@"