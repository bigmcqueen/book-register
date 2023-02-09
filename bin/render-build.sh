set -o errexit

rm -rf /book-register/tmp/pids/server.pid

bundle exec rails db:migrate

exec "$@"