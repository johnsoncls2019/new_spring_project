#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/mchrist1/demo/spring_project/src
COPY pom.xml /home/mchrist1/demo/spring_project
RUN mvn -f /home/mchrist1/demo/spring_project/pom.xml clean package
COPY ./target/demo-docker-0.0.1-SNAPSHOT.jar /var/lib/docker/tmp/docker-builder545133220/target/ 

WORKDIR /var/lib/docker/tmp/docker-builder545133220/target/ 

RUN sh -c 'touch demo-docker-0.0.1-SNAPSHOT.jar'

#
# Package stage
#
FROM openjdk:11-jre-slim
EXPOSE 5000 
ENTRYPOINT ["java","-jar","demo-docker-0.0.1-SNAPSHOT.jar"]
