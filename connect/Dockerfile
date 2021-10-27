FROM confluentinc/cp-kafka-connect-base:6.2.1

RUN confluent-hub install --no-prompt couchbase/kafka-connect-couchbase:4.1.3

COPY ./scripts/create-connectors.sh /scripts/

CMD ["bash", "/scripts/create-connectors.sh"]
