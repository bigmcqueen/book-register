FROM ruby:3.2.0

RUN apt-get update && apt-get install -y \
	build-essential \
	libpq-dev \
	nodejs \
	postgresql-client \
	yarn

WORKDIR /book_register
COPY Gemfile Gemfile.lock /book_register/
RUN bundle install