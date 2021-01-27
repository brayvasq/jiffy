FROM ruby:2.7

RUN apt-get update -yqq
RUN apt-get install curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN npm install yarn -g

COPY . /usr/src/app/

WORKDIR /usr/src/app
RUN bundle install && yarn install
