FROM ruby:3.0.3

MAINTAINER Aziz Kakhorov <kaxopob.azizuz@gmail.com>

RUN curl -sL https://deb.nodesource.com/setup_20.x | bash

RUN apt update -q && apt install -y \
    build-essential \
    libpq-dev \
    postgresql-client \
    nodejs \
    nano > /dev/null

ENV APP_PATH /app
RUN mkdir -p $APP_PATH
WORKDIR $APP_PATH

ENV BUNDLE_PATH /bundle
ENV GEM_HOME /bundle
ENV PATH="/bundle/bin:${PATH}"

RUN printf 'export EDITOR="nano" \n' >> ~/.bashrc

RUN printf '\
alias rc="bundle exec rails console" \n\
alias rtest="RAILS_ENV=test bundle exec rspec" \n\
alias be="bundle exec" \n\
alias rg="bundle exec rails generate" \n\
alias dp="bundle exec cap production deploy" \n\
alias credit="bundle exec rails credentials:edit -e development" \n\
alias migrate_all="bundle exec rails db:migrate && RAILS_ENV=test bundle exec rails db:migrate" \n\
alias rollback_all="bundle exec rails db:rollback && RAILS_ENV=test bundle exec rails db:rollback" \n\
alias guardtest="be guard -P minitest" \n\
alias r="be rubocop -A" \n\
' >> ~/.bashrc

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
