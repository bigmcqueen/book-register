FROM ruby:3.2.0

ENV RAILS_ENV=production

RUN apt-get update && apt-get install -y postgresql-client

RUN mkdir /book_register
WORKDIR /book_register
COPY Gemfile Gemfile.lock /book_register/

RUN gem update --system 3.3.20 && bundle install
COPY . /book_register

COPY bin/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]