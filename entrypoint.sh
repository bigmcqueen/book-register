#!/bin/bash
set -e
 
# Rails特有の問題を解決するためのコマンド
rm -f /book_register/tmp/pids/server.pid

# production環境の場合のみJSとCSSをビルド
if [ "$RAILS_ENV" = "production" ]; then
  bundle exec rails db:migrate
fi

# サーバー実行(DockerfileのCMDをセット)
exec "$@"