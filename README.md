# README

### install & run server

```
$ docker compose build
$ docker compose run --rm app bundle install
$ docker compose run --rm app bundle exec rake db:create db:migrate
$ docker compose run
```

### execute in rails console

```
docker compose run --rm app bundle exec rails c
```
