# Passbase-challenge

## commands
use docker to run this project: \
`docker-compose build`\
`docker-compose run web rake db:create db:migrate`\
`docker-compose up`\

run tests: `docker-compose run web bundle exec rspec`\
run rubocop: `docker-compose run web bundle exec rubocop`\

##API documentation

`/api/v1/swagger_doc`\