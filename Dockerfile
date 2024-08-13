FROM maven:3.9-eclipse-temurin-11-alpine AS build

WORKDIR /usr/src
COPY ./org.exram.tinkerpop ./

RUN mvn verify


FROM tinkerpop/gremlin-server:3.7.2

WORKDIR /opt/gremlin-server
COPY ./conf/tinkergraph.properties ./conf/
COPY ./conf/gremlin-server.yaml ./conf/
COPY --from=build /usr/src/target/org.exram.tinkerpop.jar ./lib/

# Until https://github.com/apache/tinkerpop/pull/2712 is merged
COPY ./submodules/tinkerpop/gremlin-server/src/main/docker/docker-entrypoint.sh /docker-entrypoint.sh
COPY ./submodules/tinkerpop/gremlin-server/src/main/bin/gremlin-server.sh ./bin/gremlin-server.sh
