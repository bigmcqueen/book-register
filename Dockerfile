FROM ruby:3.2.0

ENV LANG=C.UTF-8

ENV RAILS_ENV=production

RUN apt-get update && apt-get install -y \
	build-essential \
	libpq-dev \
	nodejs \
	postgresql-client \
	yarn
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /book_register
COPY Gemfile Gemfile.lock /book_register/

RUN bundle install

COPY /bin/render-build.sh /usr/bin/
RUN chmod +x /usr/bin/render-build.sh
ENTRYPOINT ["render-build.sh"]
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-e", "production", "-C", "config/puma.rb"]