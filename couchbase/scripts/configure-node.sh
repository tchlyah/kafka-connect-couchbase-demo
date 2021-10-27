#!/bin/bash

set -x
set -m

/entrypoint.sh couchbase-server &

echo "waiting for http://localhost:8091/ui/index.html"
while [ "$(curl -Isw '%{http_code}' -o /dev/null http://localhost:8091/ui/index.html#/)" != 200 ]
do
    sleep 5
done

echo "Setup index and memory quota"
curl -X POST http://127.0.0.1:8091/pools/default -d memoryQuota=1000 -d indexMemoryQuota=1000

echo "Setup services"
curl http://127.0.0.1:8091/node/controller/setupServices -d services=kv%2Cn1ql%2Cindex

echo "Setup credentials"
curl http://127.0.0.1:8091/settings/web -d port=8091 -d username=Administrator -d password=password

# Load beer-sample sample buckets
curl -u Administrator:password -X POST http://127.0.0.1:8091/sampleBuckets/install -d '["beer-sample"]'

fg 1
