#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/mchrist1/demo/spring_project/src
COPY pom.xml /home/mchrist1/demo/spring_project
RUN mvn -f /home/mchrist1/demo/spring_project/pom.xml clean package
RUN mkdir -p /opt/demo-0.0.1/lib
WORKDIR /opt/demo-0.0.1/
COPY target/demo-0.0.1-SNAPSHOT.jar /opt/demo-0.0.1/lib/demo-0.0.1-SNAPSHOT.jar
# ADD target/demo-0.0.1-SNAPSHOT.jar /opt/demo-0.0.1/lib/
RUN sh -c 'touch demo-0.0.1-SNAPSHOT.jar'
#
# Package stage
#
FROM openjdk:11-jre-slim
EXPOSE 5000 
ENTRYPOINT ["-jar", "/home/mchrist1/demo/spring_project/target/demo-0.0.1-SNAPSHOT.jar"] 

