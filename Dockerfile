FROM node:12.18

LABEL maintainer="Arthur Gehrke <arthurgehrke07@gmail.com>"

RUN mkdir -p /usr/app/docker-adonis

ENV APP=/usr/app/docker-adonis

COPY package.json $APP

WORKDIR $APP

RUN npm install --silent -g @adonisjs/cli

CMD bash ./infra/docker/init.sh
