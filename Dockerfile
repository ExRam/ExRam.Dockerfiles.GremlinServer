FROM maven:3.9-eclipse-temurin-11-alpine AS build

WORKDIR /usr/src
COPY ./org.exram.tinkerpop ./

RUN mvn verify


FROM tinkerpop/gremlin-server:3.7.2

COPY tinkergraph.properties /opt/gremlin-server/conf/
COPY gremlin-server.yaml /opt/gremlin-server/conf/
COPY --from=build /usr/src/target/org.exram.tinkerpop.jar /opt/gremlin-server/lib/

# Until https://github.com/apache/tinkerpop/pull/2712 is merged
COPY submodules/tinkerpop/gremlin-server/src/main/docker/docker-entrypoint.sh /docker-entrypoint.sh
COPY submodules/tinkerpop/gremlin-server/src/main/bin/gremlin-server.sh /opt/gremlin-server/bin/gremlin-server.sh