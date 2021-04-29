# Passbase-challenge

## commands
use docker to run this project: \
`docker-compose build`\
`docker-compose run web rake db:create db:migrate db:seed`\
`docker-compose up`

run tests: `docker-compose run web bundle exec rspec`\
run rubocop: `docker-compose run web bundle exec rubocop`

## API documentation

`/api/v1/swagger_doc`
