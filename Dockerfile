FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /passbase-challenge
COPY Gemfile /passbase-challenge/Gemfile
COPY Gemfile.lock /passbase-challenge/Gemfile.lock
RUN bundle install 

COPY ../compose /passbase-challenge
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
