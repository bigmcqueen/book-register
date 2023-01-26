FROM ruby:3.2.0-bullseye

RUN apt-get update && apt-get install -y \
	build-essential \
	libpq-dev \
	nodejs \
	postgresql-client \
	yarn
WORKDIR /book-register
COPY Gemfile Gemfile.lock /book-register/
RUN bundle install