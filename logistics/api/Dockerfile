FROM ruby:2.5.1-alpine3.7

RUN apk update && apk add build-base

RUN mkdir /application
WORKDIR /application
ADD Gemfile /application/Gemfile
ADD Gemfile.lock /application/Gemfile.lock
RUN bundle install
ADD . /application

CMD rackup -o 0.0.0.0