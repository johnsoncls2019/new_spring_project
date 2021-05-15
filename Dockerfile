#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
MAINTAINER johnsoncls
COPY pom.xml /build/
COPY src /build/src/
RUN mvn -f /build/pom.xml clean package

WORKDIR /build/
RUN mvn package
# Package stage

FROM openjdk:11-jre-slim
WORKDIR /build/
EXPOSE 5000 
ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"] 

