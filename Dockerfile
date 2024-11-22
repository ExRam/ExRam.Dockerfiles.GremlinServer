FROM tinkerpop/gremlin-server:3.7.3

WORKDIR /opt/gremlin-server
COPY ./conf/tinkergraph.properties ./conf/
COPY ./conf/gremlin-server.yaml ./conf/

# Until https://github.com/apache/tinkerpop/pull/2712 is merged
COPY ./submodules/tinkerpop/gremlin-server/src/main/docker/docker-entrypoint.sh /docker-entrypoint.sh
COPY ./submodules/tinkerpop/gremlin-server/src/main/bin/gremlin-server.sh ./bin/gremlin-server.sh
