FROM ruby:2.5-slim-stretch

RUN apt-get update && apt-get install -qq -y \
      build-essential \
      libpq-dev \
      git \
      --fix-missing \
      --no-install-recommends

RUN gem install bundler

RUN ["mkdir", "/app"]
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install -j 8 --frozen --without development test

CMD ["bundle", "exec", "puma"]
