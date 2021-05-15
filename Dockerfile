#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
COPY src /home/mchrist1/demo/spring_project/src
COPY pom.xml /home/mchrist1/demo/spring_project
RUN mvn -f /home/mchrist1/demo/spring_project/pom.xml clean package
COPY  /home/mchrist1/demo/spring_project/target/ demo-0.0.1-SNAPSHOT.jar /usr/local/lib/demo.jar 
WORKDIR /usr/app 
#
# Package stage
#
FROM openjdk:11-jre-slim
EXPOSE 5000 
ENTRYPOINT ["java","-jar","demo-0.0.1-SNAPSHOT.jar"]
