#!/bin/sh

if [[ -z "$(ls -A $PWD | grep .env)" ]]; then
	echo "no .env file found."
	exit 1
fi

source .env

if [[ "$NODE_ENV" == "development" ]]; then
	yarn install --ignore-engines --silent
  node --harmony ace migration:run --force
	yarn dev:server
else
	yarn install --silent --production
	yarn start
fi
