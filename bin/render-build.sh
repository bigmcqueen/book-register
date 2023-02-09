set -o errexit

rm -rf /book-register/tmp/pids/server.pid

bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate
bundle exec puma -C config/puma.rb