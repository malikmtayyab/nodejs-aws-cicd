#!/bin/bash
set -x

NUMBER_OF_ATTEMPTS=10
SLEEP_TIME=3
APP_PORT=8080  # Port your Express app is running on

# Ensure the Node.js application is running by making an HTTP GET request to the root endpoint.
for i in `seq 1 $NUMBER_OF_ATTEMPTS`;
do
  HTTP_CODE=`curl --write-out '%{http_code}' -o /dev/null -m 10 -q -s http://localhost:$APP_PORT`
  if [ "$HTTP_CODE" == "200" ]; then
    echo "Node.js application is running."
    exit 0
  fi
  echo "Attempt to curl endpoint returned HTTP Code $HTTP_CODE. Backing off and retrying."
  sleep $SLEEP_TIME
done

echo "Node.js application did not come up after expected time. Failing."
exit 1
