FROM tinkerpop/gremlin-server:3.7.2

COPY tinkergraph.properties /opt/gremlin-server/conf/
COPY gremlin-server.yaml /opt/gremlin-server/conf/