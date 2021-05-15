#
# Build stage
#
FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD

MAINTAINER johnsoncls
COPY pom.xml /build/
COPY src /build/src/
RUN mvn -f /build/pom.xml clean package

WORKDIR /build/
RUN mvn package
# Package stage

FROM openjdk:8-jre-alpine
WORKDIR /build/
EXPOSE 5000 
ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"] 

