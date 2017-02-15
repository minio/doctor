FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /doctor
WORKDIR /doctor
ADD Gemfile Gemfile.lock /doctor/
RUN bundle install
ADD . /doctor
RUN rm config/database.yml
