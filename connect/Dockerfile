FROM confluentinc/cp-kafka-connect-base:6.2.1

RUN confluent-hub install --no-prompt couchbase/kafka-connect-couchbase:4.1.3

USER root
RUN curl -v https://repo1.maven.org/maven2/org/apache/kafka/connect-transforms/3.1.0/connect-transforms-3.1.0.jar --output /usr/share/java/kafka/connect-transforms-3.1.0.jar

USER appuser

COPY ./scripts/create-connectors.sh /scripts/

CMD ["bash", "/scripts/create-connectors.sh"]
