FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y nodejs npm && \
    npm install -g yarn

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

RUN yarn install && yarn build

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
