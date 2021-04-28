FROM ruby:3.0.0

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /take-home-challenge
WORKDIR /take-home-challenge
COPY Gemfile /take-home-challenge/Gemfile
COPY Gemfile.lock /take-home-challenge/Gemfile.lock
RUN bundle install
COPY . /take-home-challenge

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
