# https://zenn.dev/shima_zu/articles/docker_on_rails6_mysql8
docker-compose run --rm web rails new . --force --no-deps --database=mysql --skip-turbolinks --skip-test
docker-compose run --rm web bin/rails webpacker:installs
# database.ymlの書き換え
docker-compose build
docker-compose run web bin/rails db:create
docker-compose up -d