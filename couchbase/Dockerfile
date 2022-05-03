FROM couchbase

COPY ./scripts/configure-node.sh /

RUN ["chmod", "+x", "/configure-node.sh"]

ENTRYPOINT ["/configure-node.sh"]
