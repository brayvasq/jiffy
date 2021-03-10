FROM ruby:2.7

LABEL maintainer="brayvasq@gmail.com"

RUN apt-get update -yqq && \ 
    apt-get install curl && \
    curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y \
    nodejs

RUN npm install yarn -g

COPY Gemfile* /usr/src/app/
COPY package* /usr/src/app/
COPY yarn* /usr/src/app/

WORKDIR /usr/src/app

ENV BUNDLE_PATH /gems

RUN bundle install 
RUN yarn install

COPY . /usr/src/app/

# This will execute the following
# ./docker-entrypoint.sh bin/rails s -b 0.0.0.0
ENTRYPOINT [ "./docker-entrypoint.sh" ]
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
