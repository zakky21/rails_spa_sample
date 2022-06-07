FROM ruby:2.7.5
ENV LANG C.UTF-8

RUN apt-get install
ENV APP_ROOT /usr/src/app

WORKDIR $APP_ROOT

RUN apt-get dist-upgrade && \
    apt-get update && \
    apt-get install -y \
    postgresql-client \
    ruby-dev \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# 開発環境ではvolumeをマウントする
RUN mkdir /bundle

ENV BUNDLE_PATH /bundle
ENV GEM_HOME /bundle

EXPOSE 3000
CMD bash -c "rm -f tmp/pids/server.pid && bundle exec rails s -b 0.0.0.0 -p $PORT"
