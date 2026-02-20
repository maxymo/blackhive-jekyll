FROM ruby:3.1 AS builder

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

RUN bundle exec jekyll build

FROM nginx:alpine

COPY --from=builder /app/_site /usr/share/nginx/html

EXPOSE 80
