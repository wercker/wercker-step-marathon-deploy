#!/bin/sh

if [ -z $WERCKER_MARATHON_DEPLOY_APP_JSON_FILE ]; then
  fail "You must specify a JSON file to deploy" 
fi

if [ -z $WERCKER_MARATHON_DEPLOY_MARATHON_URL ]; then
  fail "You must specify a valid marathon URL"
fi

MARATHON_ENDPOINT="$WERCKER_MARATHON_DEPLOY_MARATHON_URL/v2/apps"

info "deploying $WERCKER_MARATHON_DEPLOY_APP_JSON_FILE"
cat $WERCKER_MARATHON_DEPLOY_APP_JSON_FILE

info "destroying previous instances..."

if [ -z $WERCKER_MARATHON_DEPLOY_APP_NAME ]; then
  fail "You must specify a valid app name"
fi

curl -X DELETE -H "Authorization: token=$WERCKER_MARATHON_DEPLOY_AUTH_TOKEN" -H "Content-type: application/json" $MARATHON_ENDPOINT/$WERCKER_MARATHON_DEPLOY_APP_NAME

info "deploying new version..."
sleep 1

curl -X POST -H "Authorization: token=$WERCKER_MARATHON_DEPLOY_AUTH_TOKEN" -H "Content-type: application/json" -d @$WERCKER_MARATHON_DEPLOY_APP_JSON_FILE $MARATHON_ENDPOINT

success "Deploy successful"
