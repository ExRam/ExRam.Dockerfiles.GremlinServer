FROM tinkerpop/gremlin-server:3.7.3

WORKDIR /opt/gremlin-server
COPY ./conf/tinkergraph.properties ./conf/
COPY ./conf/gremlin-server.yaml ./conf/
