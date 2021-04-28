# Passbase-challenge

## commands
use docker to run this app: docker-compose up
run tests: docker-compose run -e "RAILS_ENV=test" web bundle exec rspec
run rubocop: docker-compose run -e "RAILS_ENV=development" web bundle exec rubocop
