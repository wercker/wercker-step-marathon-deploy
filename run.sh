#!/bin/sh

if [ -z $WERCKER_MARATHON_DEPLOY_APP_JSON_FILE ]; then
  fail "You must specify a JSON file to deploy"
fi

if [ -z $WERCKER_MARATHON_DEPLOY_MARATHON_URL ]; then
  fail "You must specify a valid marathon URL"
fi

MARATHON_ENDPOINT="$WERCKER_MARATHON_DEPLOY_MARATHON_URL/v2/apps"
echo "Marathon Endpoint: $MARATHON_ENDPOINT"
info "deploying $WERCKER_MARATHON_DEPLOY_APP_JSON_FILE"
cat $WERCKER_MARATHON_DEPLOY_APP_JSON_FILE

if [ -z $WERCKER_MARATHON_DEPLOY_APP_NAME ]; then
  fail "You must specify a valid app name"
fi

info "\nDeploying new version"

if ! curl --fail --write-out "\n\nStatus code: %{http_code}\n" -H "Authorization: token=$WERCKER_MARATHON_DEPLOY_AUTH_TOKEN" -H "Content-type: application/json" -X PUT -d @$WERCKER_MARATHON_DEPLOY_APP_JSON_FILE $MARATHON_ENDPOINT; then
  fail "unable to deploy new version of app"
fi

success "\nDeploy successful"
