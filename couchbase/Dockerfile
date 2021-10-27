FROM couchbase/server:7.0.2

COPY ./scripts/configure-node.sh /

RUN ["chmod", "+x", "/configure-node.sh"]

ENTRYPOINT ["/configure-node.sh"]
