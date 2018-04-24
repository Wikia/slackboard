#!/bin/bash
set -e

sed -i "s#SLACK_URL#$SLACK_URL#" /slackboard.toml
sed -i "s/CHANNEL/$CHANNEL/" /slackboard.toml
sed -i "s/TAG/$TAG/" /slackboard.toml
sed -i "s/QPS/$QPS/" /slackboard.toml
sed -i "s/MAX_DELAY/$MAX_DELAY/" /slackboard.toml

exec "$@"
