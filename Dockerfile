FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /destiny
WORKDIR /destiny
ADD Gemfile /destiny/Gemfile
ADD Gemfile.lock /destiny/Gemfile.lock
RUN bundle install

RUN RAILS_ENV=production /destiny/bin/rails assets:precompile

ADD . /destiny
