#!/bin/sh

resp=$(curl --request POST \
  --url "https://${AUTH0_DOMAIN}/oauth/token" \
  --header 'content-type: application/x-www-form-urlencoded' \
  --data "audience=${AUTH0_API_IDENTIFIER}&grant_type=client_credentials&client_id=${AUTH0_CLIENT_ID}&client_secret=${AUTH0_CLIENT_SECRET}")

access_token=$(echo $resp | jq -r '.access_token')

curl --request POST \
  --url "${SERVER_HOST}/graphql" \
  --header 'Content-Type: application/json' \
  --header "Authorization: Bearer ${access_token}" \
  --data '{ "query": "{ sendWeeklyEmail }" }'

