#!/usr/bin/env bash

/etc/confluent/docker/run &

echo "Waiting for Kafka Connect to start listening on kafka-connect ⏳"
while :; do
  curl_status=$(curl -s -o /dev/null -w %{http_code} http://localhost:8083/connectors)
  echo -e "$(date) Kafka Connect listener HTTP state: $curl_status (waiting for 200)"
  if [ "$curl_status" -eq 200 ] ; then
    break
  fi
  sleep 5
done

echo -e "\n--\n+> Creating Kafka Connector(s)"
pushd /data/connectors || exit 1
for connector in *.json; do
  echo "Creating connector ${connector%%.json}"

  curl -X POST \
    -H "Content-Type: application/json" \
    --data-binary "@${connector}" \
    http://localhost:8083/connectors

done
popd || exit 1

sleep infinity
